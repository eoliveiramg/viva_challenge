class Property < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :provinces, through: :locations, dependent: :destroy

  after_save :set_location

  validates_presence_of :title,
                        :description,
                        :price,
                        :lat,
                        :long,
                        :beds,
                        :baths,
                        :square_meters

  validates_uniqueness_of :lat, :scope => :long

  validates_numericality_of :lat, less_than_or_equal_to: 1400, greater_than_or_equal_to: 0
  validates_numericality_of :long, less_than_or_equal_to: 1000, greater_than_or_equal_to: 0
  validates_numericality_of :beds, less_than_or_equal_to: 5, greater_than_or_equal_to: 1
  validates_numericality_of :baths, less_than_or_equal_to: 4, greater_than_or_equal_to: 1
  validates_numericality_of :square_meters, less_than_or_equal_to: 240, greater_than_or_equal_to: 20

  scope :find_by_coordinates, ->(upper_x:, upper_y:, bottom_x:, bottom_y:) do
    where('lat >= ? and lat <= ? and long <= ? and long >= ?', upper_x, bottom_x, upper_y, bottom_y)
  end

  private

  def set_location
    ActiveRecord::Base.transaction do
      select_provinces.each do |province|
        Location.create!(property: self, province: province)
      end
    end
  end

  def select_provinces
    Province.all.select do |province|
      (province.upper_left_x..province.bottom_right_x).include?(self.lat) and
        (province.bottom_right_y..province.upper_left_y).include?(self.long)
    end
  end
end

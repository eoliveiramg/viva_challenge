class Province < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :properties, through: :locations, dependent: :destroy

  validates_presence_of :name,
                        :upper_left_x,
                        :upper_left_y,
                        :bottom_right_x,
                        :bottom_right_y

  validates_uniqueness_of :name
end

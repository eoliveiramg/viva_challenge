class Province < ActiveRecord::Base
  validates_presence_of :name,
                        :upper_left_x,
                        :upper_left_y,
                        :bottom_right_x,
                        :bottom_right_y

  validates_uniqueness_of :name

  def get_all_coordinates
    {
      upper_left_x: self.upper_left_x,
      upper_left_y: self.upper_left_y,
      upper_right_x: self.bottom_right_x,
      upper_right_y: self.upper_left_y,
      bottom_left_x: self.upper_left_x,
      bottom_left_y: self.bottom_right_y,
      bottom_right_x: self.bottom_right_x,
      bottom_right_y: self.bottom_right_y
    }
  end
end

class Province < ActiveRecord::Base
  validates_presence_of :name,
                        :upper_left_x,
                        :upper_left_y,
                        :bottom_right_x,
                        :bottom_right_y
end

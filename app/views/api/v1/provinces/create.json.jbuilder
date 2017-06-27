json.foundProperties @provinces.count

json.properties @provinces do |province|
  json.extract! province, :name, :upper_left_x, :upper_left_y, :bottom_right_x, :bottom_right_y
end

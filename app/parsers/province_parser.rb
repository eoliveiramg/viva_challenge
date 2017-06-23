class ProvinceParser
  def self.parse(province_params)
    province_return = []

    province_params.each do |key, value|
      value = value.to_hash.with_indifferent_access

      province_return << {
        name: key,
        upper_left_x: value.fetch(:boundaries).fetch(:upperLeft).fetch(:x),
        upper_left_y: value.fetch(:boundaries).fetch(:upperLeft).fetch(:y),
        bottom_right_x: value.fetch(:boundaries).fetch(:bottomRight).fetch(:x),
        bottom_right_y: value.fetch(:boundaries).fetch(:bottomRight).fetch(:y)
      }
    end

    province_return
  end
end
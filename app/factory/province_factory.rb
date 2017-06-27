class ProvinceFactory
  def self.build(province_params)
    province_params.to_h.map do |key, value|
      Province.new(
        name: key,
        upper_left_x: value.fetch(:boundaries).fetch(:upperLeft).fetch(:x),
        upper_left_y: value.fetch(:boundaries).fetch(:upperLeft).fetch(:y),
        bottom_right_x: value.fetch(:boundaries).fetch(:bottomRight).fetch(:x),
        bottom_right_y: value.fetch(:boundaries).fetch(:bottomRight).fetch(:y)
      )
    end
  end
end
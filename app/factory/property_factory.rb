class PropertyFactory
  def self.build(property_params)
    Property.new(
      title: property_params.fetch(:title),
      description: property_params.fetch(:description),
      price: property_params.fetch(:price),
      lat: property_params.fetch(:x),
      long: property_params.fetch(:y),
      beds: property_params.fetch(:beds),
      baths: property_params.fetch(:baths),
      square_meters: property_params.fetch(:squareMeters)
    )
  end
end

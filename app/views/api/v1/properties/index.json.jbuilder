json.foundProperties @properties.count

json.properties @properties do |property|
  json.extract! property, :id, :title, :price, :description

  json.x property.lat
  json.y property.long

  json.extract! property, :beds, :baths

  json.provinces property.provinces.pluck(:name)
  json.squareMeters property.square_meters
end

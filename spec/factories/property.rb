FactoryGirl.define do
  factory :property, class: Property do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.number(6) }
    lat { Faker::Number.between(0, 1400) }
    long { Faker::Number.between(0, 1000) }
    beds { Faker::Number.between(1, 5) }
    baths { Faker::Number.between(1, 4) }
    square_meters { Faker::Number.between(20, 240) }
  end
end

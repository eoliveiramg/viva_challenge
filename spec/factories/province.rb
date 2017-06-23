FactoryGirl.define do
  factory :province, class: Province do
    name { Faker::Name.name  }
    upper_left_x { Faker::Number.between(1, 10) }
    upper_left_y { Faker::Number.between(1000, 1100) }
    bottom_right_x { Faker::Number.between(600, 610) }
    bottom_right_y { Faker::Number.between(500, 510) }
  end
end

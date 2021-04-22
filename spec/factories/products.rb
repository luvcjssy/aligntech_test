FactoryBot.define do
  factory :product do
    name { Faker::Food.fruits }
    price { Faker::Number.decimal }
  end
end

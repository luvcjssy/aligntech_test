FactoryBot.define do
  factory :order_detail do
    order { create(:order) }
    product { create(:product) }
    price { Faker::Number.decimal }
    quantity { Faker::Number.number(digits: 2) }
  end
end

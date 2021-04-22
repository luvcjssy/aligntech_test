FactoryBot.define do
  factory :order do
    customer { create(:customer) }
    status { 0 }
    shipping_address { Faker::Address.full_address }
    order_email { Faker::Internet.email }

    trait :with_items do
      after(:create) do |order|
        create_list(:order_detail, 3, order: order)
      end
    end
  end
end

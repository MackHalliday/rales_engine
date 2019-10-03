FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Hipster.sentence }
    unit_price { Faker::Commerce.price(range: 0..100.0) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }

  end
end

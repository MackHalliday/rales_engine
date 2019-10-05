FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.within(range: 1..10) }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end

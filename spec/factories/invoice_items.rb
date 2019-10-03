FactoryBot.define do
  factory :invoice_items do
    quantity: Faker::Number.within(range: 1..10)
    unit_price: Faker::Commerce.price(range: 0..100.0)
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)
  end
end

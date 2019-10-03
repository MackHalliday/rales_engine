FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Business.credit_card_number }
    credit_card_expiration_date { nil }
    result { "success" }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end

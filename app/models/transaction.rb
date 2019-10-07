class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number,
                        :result,
                        :created_at,
                        :updated_at

  belongs_to :invoice
  has_one :customer, through: :invoice
end

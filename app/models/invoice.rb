class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :created_at,
                        :updated_at
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
end

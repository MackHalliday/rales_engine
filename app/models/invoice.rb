class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :created_at,
                        :updated_at
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
end

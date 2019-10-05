class Merchant < ApplicationRecord
  validates_presence_of :name,
                        :created_at,
                        :updated_at
  has_many :invoices
  has_many :items
end

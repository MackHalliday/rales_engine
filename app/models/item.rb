class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :created_at,
                        :updated_at
  belongs_to :merchant
  has_many :invoice_items
end

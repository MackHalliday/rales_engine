class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :created_at,
                        :updated_at
  belongs_to :merchant
  belongs_to :customer
end

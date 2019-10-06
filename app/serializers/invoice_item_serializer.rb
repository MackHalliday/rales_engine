class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price

  attribute :unit_price do |object|
     object.unit_price.insert(-3, '.')
  end
end

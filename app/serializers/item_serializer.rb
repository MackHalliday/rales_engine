class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
              :merchant_id,
              :name,
              :description,
              :unit_price

  attribute :unit_price do |object|
     object.unit_price.insert(-3, '.')
  end
end

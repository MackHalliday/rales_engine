class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
              :merchant_id,
              :name,
              :description,
              :unit_price,
              :created_at,
              :updated_at
end

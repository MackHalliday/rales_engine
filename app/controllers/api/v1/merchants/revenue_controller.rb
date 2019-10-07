class Api::V1::Merchants::RevenueController < ApplicationController
  def most_revenue

    quantity = request.query_parameters.values.join
    merchants = Merchant.joins(items: [:invoice_items])
      .select("merchants.*, SUM(items.unit_price * invoice_items.quantity) AS revenue")
      .group(:id)
      .order('revenue DESC')
      .limit(quantity)
    
    render json: MerchantSerializer.new(merchants)
  end
end

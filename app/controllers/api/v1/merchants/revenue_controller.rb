class Api::V1::Merchants::RevenueController < ApplicationController
  def most_revenue

    quantity = request.query_parameters.values.join
    merchants = Merchant.joins(invoices:[:transactions, :invoice_items])
      .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .group(:id)
      .order("revenue DESC")
      .limit(quantity)
    binding.pry
    render json: MerchantSerializer.new(merchants)
  end
end

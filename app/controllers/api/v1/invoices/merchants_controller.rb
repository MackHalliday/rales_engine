class Api::V1::Invoices::MerchantsController < ApplicationController
  def index
    invoice = Invoice.find(params[:id])
    render json: MerchantSerializer.new(invoice.merchant)
  end
end

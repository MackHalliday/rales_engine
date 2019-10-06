class Api::V1::Merchants::SearchController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.where(merchant_query))
  end

  def show
    render json: MerchantSerializer.new(Merchant.where(merchant_query).first)
  end

  private
  def merchant_query
    request.query_parameters.transform_keys(&:downcase)
  end
end

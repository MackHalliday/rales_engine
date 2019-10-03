class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    if request.params[:id] == "find_all"
      render json: MerchantSerializer.new(Merchant.where(merchant_info))
    elsif request.params[:id] == "random"
      render json: MerchantSerializer.new(Merchant.order('RANDOM()').first)
    else
      render json: MerchantSerializer.new(Merchant.find_by(merchant_info))
    end
  end

  private
  def merchant_info

    return request.query_parameters.transform_keys(&:downcase) if request.query_parameters.present?
    {id: params[:id]}
  end
end

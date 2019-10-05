class Api::V1::Customers::SearchController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.where(merchant_query))
  end

  def show
    render json: CustomerSerializer.new(Customer.find_by(merchant_query))
  end

  private
  def merchant_query
    request.query_parameters.transform_keys(&:downcase)
  end
end

class Api::V1::Customers::SearchController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.where(customer_query))
  end

  def show
    render json: CustomerSerializer.new(Customer.where(customer_query).first)
  end

  private
  def customer_query
    request.query_parameters.transform_keys(&:downcase)
  end
end

class Api::V1::Transactions::SearchController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.where(transactions_query))
  end

  def show
    render json: TransactionSerializer.new(Transaction.where(transactions_query).first)
  end

  private
  def transactions_query
    request.query_parameters.transform_keys(&:downcase)
  end
end

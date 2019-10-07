class Api::V1::Transactions::InvoicesController < ApplicationController
  def index
    transaction = Transaction.find(params[:id])
    render json: InvoiceSerializer.new(transaction.invoice)
  end
end

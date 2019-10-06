class Api::V1::Invoices::CustomersController < ApplicationController
  def index
    invoice = Invoice.find(params[:id])
    render json: CustomerSerializer.new(invoice.customers)
  end

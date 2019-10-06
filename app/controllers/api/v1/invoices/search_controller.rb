class Api::V1::Invoices::SearchController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.where(invoice_query))
  end

  def show
    render json: InvoiceSerializer.new(Invoice.where(invoice_query).first)
  end

  private
  def invoice_query
    request.query_parameters.transform_keys(&:downcase)
  end
end

class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_query))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_query).first)
  end

  private
  def invoice_item_query
    if request.query_parameters.has_key?("unit_price")
    request.query_parameters
      .transform_keys(&:downcase)
      .transform_values{|value| value.gsub(".", '')}
    else
      request.query_parameters
        .transform_keys(&:downcase)
    end
  end
end

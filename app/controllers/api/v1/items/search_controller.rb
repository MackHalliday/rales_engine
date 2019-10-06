class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.where(item_query))
  end

  def show
    render json: ItemSerializer.new(Item.where(item_query).first)
  end

  private
  def item_query
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

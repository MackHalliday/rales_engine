class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.where(item_query))
  end

  def show
    render json: ItemSerializer.new(Item.where(item_query).first)
  end

  private
  def item_query
    request.query_parameters
      .transform_keys(&:downcase)
      .transform_values{|value| value.gsub(".", '')}
  end
end

class Api::V1::Items::FindController < ApplicationController
  def show
    require "pry"; binding.pry
    render json: Item.find_by(item_params)
    require "pry"; binding.pry
  end

  def index
    render json: Item.where(item_params)
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end

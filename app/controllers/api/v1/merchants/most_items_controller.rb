class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    if params[:quantity]
      render json: Merchant.most_items(params[:quantity])
    else
      render json: Merchant.most_items
    end
  end
end

class Api::V1::Merchants::ItemController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).items
  end
end

class Api::V1::Items::ItemsMerchantsController < ApplicationController

  def show
    render json: Item.find(params[:id]).merchant
  end

end

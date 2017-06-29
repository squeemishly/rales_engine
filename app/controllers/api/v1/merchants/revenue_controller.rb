class Api::V1::Merchants::RevenueController < ApplicationController


  def show
    render json: merchant = Merchant.find(params[:id]).revenue(params[:date])
    end
end

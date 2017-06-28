class Api::V1::Merchants::MerchantRevenueController < ApplicationController


  def show
      merchant = Merchant.find(params[:id])
      render json: merchant.revenue
    end
end

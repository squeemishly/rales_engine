class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def show
    render json: { "revenue" => unit_price(Merchant.find(params[:merchant_id]).revenue) }
  end

end

class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    filter = { invoices: { created_at: params[:date] } } if params[:date]
    render json: merchant = Merchant.find(params[:id]).revenue(filter)
  end

  def show
    date = params[:date].to_datetime
    render json: Merchant.all_revenue(date)
  end

end

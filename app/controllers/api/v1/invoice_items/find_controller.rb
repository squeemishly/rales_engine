class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    if params["unit_price"]
      unit_price = params["unit_price"].split(".").join.to_f
      render json: InvoiceItem.find_by(unit_price: unit_price)
    else
      render json: InvoiceItem.find_by(item_params)
    end
  end

  def index
    if params["unit_price"]
      unit_price = params["unit_price"].split(".").join.to_f
      render json: InvoiceItem.where(unit_price: unit_price)
    else
      render json: InvoiceItem.where(item_params)
    end
  end

  private

  def item_params
    params.permit(:created_at, :updated_at, :quantity, :unit_price, :item_id, :invoice_id, :id)
  end
end

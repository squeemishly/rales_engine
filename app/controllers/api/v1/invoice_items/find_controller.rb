class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    render json: InvoiceItem.find_by(item_params)
  end

  def index
    render json: InvoiceItem.where(item_params)
  end

  private

  def item_params
    params.permit(:created_at, :updated_at, :quantity, :unit_price, :item_id, :invoice_id, :id)
  end
end

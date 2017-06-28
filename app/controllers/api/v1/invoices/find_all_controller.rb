class Api::V1::Invoices::FindAllController < ApplicationController
  def index
    render json: Invoice.where(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :status, :customer_id, :merchant_id)
  end
end

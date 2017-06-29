class Api::V1::Invoices::InvoiceMerchantsController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).merchants
  end

end

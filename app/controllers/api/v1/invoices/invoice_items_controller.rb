class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).items
  end

end

class Api::V1::Invoices::InvoiceCustomersController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).customers
  end

end

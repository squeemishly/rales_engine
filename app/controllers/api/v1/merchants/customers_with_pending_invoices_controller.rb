class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    binding.pry
    render json: Merchant.find(params[:id]).customers.joins(:invoices)
  end
end

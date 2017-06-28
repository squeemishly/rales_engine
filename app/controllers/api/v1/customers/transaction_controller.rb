class Api::V1::Customers::TransactionController < ApplicationController
  def index
    binding.pry
    render json: Transaction.where("invoice_id: Customer.find(params[:id]).invoices")
  end
end

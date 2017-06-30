class Api::V1::Transactions::TransactionsInvoiceController < ApplicationController

  def show
    render json: Transaction.find(params[:id]).invoice
  end

end

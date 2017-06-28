class Api::V1::Transactions::FindController < ApplicationController

  def index
    render json: Transactions.where(transaction_params)
  end

  def show
    render json: Transactions.find_by(transaction_params)
  end

private
  def transaction_params
    params.permit(:id, :result, :credit_card_number, :credit_card_expiration_date, :invoice_id)
  end
end

class Api::V1::InvoicesController < ApplicationController
  def index
    render json: Invoice.all
  end

  def show
  end
end

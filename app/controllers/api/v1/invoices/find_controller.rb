class Api::V1::Invoices::FindController < ApplicationController
  def show
    render json: Invoice.find_by(params.keys.first.to_s => params[params.keys.first])
  end
end

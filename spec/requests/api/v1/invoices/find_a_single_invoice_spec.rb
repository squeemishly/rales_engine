require 'rails_helper'

RSpec.describe "find an invoice" do
  context "finds a single invoice" do
    it "by the status" do
      create_list(:invoice, 3)

      get '/api/v1/invoices/find?status=refreshing'
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["status"]).to eq 'refreshing'
    end
  end
end

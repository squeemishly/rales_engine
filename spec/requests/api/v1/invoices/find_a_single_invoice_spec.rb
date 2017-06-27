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

    it "by the customer" do
      create_list(:invoice, 3)
      invoice = Invoice.first

      get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"
      invoice_parsed = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_parsed["customer_id"]).to eq invoice.customer_id
    end

    it "by the merchant" do
      create_list(:invoice, 3)
      invoice = Invoice.first

      get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"
      invoice_parsed = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_parsed["merchant_id"]).to eq invoice.merchant_id
    end
  end
end

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

    it "by the id" do
      create_list(:invoice, 3)
      invoice = Invoice.first

      get '/api/v1/invoices/find?status=refreshing'
      returned_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(returned_invoice["id"]).to eq invoice.id
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

  context "finds all invoices" do
    it "by the status" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice, status: "horrid")
      invoice4 = create(:invoice, status: "blue")

      get '/api/v1/invoices/find_all?status=refreshing'

      request = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.body).to include(invoice1.status)
      expect(response.body).to include(invoice2.status)
      expect(response.body).to_not include(invoice3.status)
      expect(response.body).to_not include(invoice4.status)
    end

    it "by the customer_id" do
      customer = create(:customer, id: 1)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice, customer_id: customer.id)
      invoice4 = create(:invoice, customer_id: customer.id)

      get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

      request = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.body).to include(invoice3.customer_id.to_s)
      expect(response.body).to include(invoice4.customer_id.to_s)
      expect(response.body).to_not include(invoice1.customer_id.to_s)
      expect(response.body).to_not include(invoice2.customer_id.to_s)
    end

    it "by the merchant_id" do
      merchant = create(:merchant)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice, merchant_id: merchant.id)
      invoice4 = create(:invoice, merchant_id: merchant.id)

      get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

      request = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.body).to include(invoice3.merchant_id.to_s)
      expect(response.body).to include(invoice4.merchant_id.to_s)
      expect(response.body).to_not include(invoice1.merchant_id.to_s)
      expect(response.body).to_not include(invoice2.merchant_id.to_s)
    end
  end
end

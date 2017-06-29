require 'rails_helper'

describe "Invoice API" do
    it "returns a collection of associated merchants" do
    merchant_1 = create(:merchant)
    invoice_1 = create(:invoice, merchant: merchant_1)

    get "/api/v1/invoices/#{invoice_1.id}/merchant"
    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(merchant_1.name)
    expect(merchant["id"]).to eq(merchant_1.id)
  end
end

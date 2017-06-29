require 'rails_helper'

describe "Invoice API" do
    xit "returns a collection of associated merchants" do
    merchant_1 = create(:merchant)
    invoice_1 = create(:invoice, merchant: merchant_1)

    get "/api/v1/invoices/#{invoice_1.id}/merchants"
    expect(response).to be_success

    customers = JSON.parse(response.body)
    expect(merchant["result"]).to eq("success")
  end
end

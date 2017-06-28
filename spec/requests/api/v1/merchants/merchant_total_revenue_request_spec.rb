require 'rails_helper'

describe "Merchants API" do
  it "returns total revenue for merchant" do
    merchant_1 = create(:merchant)
    invoices = create_list(:invoice, 3, merchant: merchant_1)

    get "/api/v1/merchants/#{merchant_1.id}/revenue"

    expect(response).to be_success

    revenue = JSON.parse(response.body)

    expect(revenue["revenue"]).to eq("120.00")
  end
end

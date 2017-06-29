require 'rails_helper'

describe "Merchants API" do
  it "returns a merchant's revenue for a given date" do

    merchant_1 = create(:merchant)
    invoice_1 = create(:invoice, merchant: merchant_1, created_at: "2012-03-16 11:55:05" )
    invoice_2 = create(:invoice, merchant: merchant_1)

    create(:invoice_item, invoice: invoice_1, quantity: 5, unit_price: 5)
    create(:invoice_item, invoice: invoice_1, quantity: 5, unit_price: 5)
    create(:invoice_item, invoice: invoice_2, quantity: 5, unit_price: 5)
    #
    create(:transaction, invoice: invoice_1, result: "success")
    create(:transaction, invoice: invoice_1, result: "failed")
    create(:transaction, invoice: invoice_2, result: "success")

    get "/api/v1/merchants/#{merchant_1.id}/revenue?date=2012-03-16 11:55:05"

    expect(response).to be_success

    merchant = response.body

    expect(merchant).to eq("0.50")
  end
end

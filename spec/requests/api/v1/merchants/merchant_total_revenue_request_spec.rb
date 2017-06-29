require 'rails_helper'

describe "Merchants API" do
  it "returns total revenue for merchant" do

    merchant_1 = create(:merchant)

    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_1)

    create(:invoice_item, invoice: invoice_1)
    create(:invoice_item, invoice: invoice_1)
    create(:invoice_item, invoice: invoice_2)
    create(:invoice_item, invoice: invoice_2)

    create(:transaction, invoice: invoice_1)
    create(:transaction, invoice: invoice_1)
    create(:transaction, invoice: invoice_2)
    create(:transaction, invoice: invoice_2)

    get "/api/v1/merchants/#{merchant_1.id}/revenue"

    expect(response).to be_success

    merchant = JSON.parse(response.body, :quirks_mode => true)

    expect(merchant).to eq(1005.96)
  end
end

require 'rails_helper'

describe "Merchants API" do
  xit "returns total revenue for merchant" do

    merchant = create(:merchant)
    invoices = create_list(:invoice, 2, merchant: merchant)
    create_list(:invoice_item, 2, invoice: invoices.first, unit_price: 2, quantity: 2)
    create_list(:invoice_item, 3, invoice: invoices.second, unit_price: 3, quantity: 3)


    get "/api/v1/merchants/#{merchant.id}/revenue"


    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant).to have_key("revenue")
    expect(merchant["revenue"]).to eq(35)
  end
end

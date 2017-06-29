require 'rails_helper'

describe "Customers API" do

  it "returns a customer's favorite merchant" do

    customer_1 = create(:customer)

    merchant_1, merchant_2 = create_list(:merchant, 2)

    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer_1, merchant: merchant_1)
    invoice_3 = create(:invoice, customer: customer_1, merchant: merchant_1)

    invoice_4 = create(:invoice, customer: customer_1, merchant: merchant_2)
    invoice_5 = create(:invoice, customer: customer_1, merchant: merchant_2)
    invoice_6 = create(:invoice, customer: customer_1, merchant: merchant_2)

    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_3)
    transaction_3 = create(:transaction, invoice: invoice_2, result: "failed" )

    transaction_4 = create(:transaction, invoice: invoice_4)
    transaction_5 = create(:transaction, invoice: invoice_5)
    transaction_6 = create(:transaction, invoice: invoice_6)

    get "/api/v1/customers/#{customer_1.id}/favorite_merchant"

    merchants = JSON.parse(response.body)

    expect(response).to be_success

    expect(merchants["id"]).to eq merchant_2.id
    expect(merchants["id"]).to_not eq merchant_1.id
  end

end

require 'rails_helper'

RSpec.describe "a merchants favorite customer can be found" do
  it "by looking at the number of successful transactions" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)

    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)
    customer4 = create(:customer)

    invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
    invoice3 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
    invoice4 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
    invoice5 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
    invoice6 = create(:invoice, customer_id: customer3.id, merchant_id: merchant1.id)
    invoice7 = create(:invoice, customer_id: customer3.id, merchant_id: merchant1.id)
    invoice7 = create(:invoice, customer_id: customer4.id, merchant_id: merchant2.id)

    create(:transaction, invoice_id: invoice1.id)
    create(:transaction, invoice_id: invoice2.id)
    create(:transaction, invoice_id: invoice3.id, result: "failed")
    create(:transaction, invoice_id: invoice3.id)
    create(:transaction, invoice_id: invoice4.id)
    create(:transaction, invoice_id: invoice5.id)
    create(:transaction, invoice_id: invoice6.id)
    create(:transaction, invoice_id: invoice7.id)

    get "/api/v1/merchants/#{merchant1.id}/favorite_customer"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq customer2.id
    expect(customer.first["id"]).to_not eq customer1.id
    expect(customer.first["id"]).to_not eq customer3.id
    expect(customer.first["id"]).to_not eq customer4.id
  end
end

require 'rails_helper'

RSpec.describe "find the top merchants by revenue" do
  it "and limit the returns" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id)
    invoice3 = create(:invoice, merchant_id: merchant1.id)
    invoice4 = create(:invoice, merchant_id: merchant2.id)
    invoice5 = create(:invoice, merchant_id: merchant2.id)
    invoice6 = create(:invoice, merchant_id: merchant3.id)

    create(:invoice_item, invoice_id: invoice1.id)
    create(:invoice_item, invoice_id: invoice1.id)
    create(:invoice_item, invoice_id: invoice2.id)
    create(:invoice_item, invoice_id: invoice3.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice5.id)
    create(:invoice_item, invoice_id: invoice5.id)
    create(:invoice_item, invoice_id: invoice6.id)

    create(:transaction, invoice_id: invoice1.id)
    create(:transaction, invoice_id: invoice2.id)
    create(:transaction, invoice_id: invoice3.id)
    create(:transaction, invoice_id: invoice3.id, result: "failed")
    create(:transaction, invoice_id: invoice4.id)
    create(:transaction, invoice_id: invoice5.id)
    create(:transaction, invoice_id: invoice6.id)

    get '/api/v1/merchants/most_revenue?quantity=1'
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["id"]).to eq merchant2.id
  end
end

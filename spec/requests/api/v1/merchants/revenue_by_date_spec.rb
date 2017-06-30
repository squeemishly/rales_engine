require 'rails_helper'

RSpec.describe "find the total revenue for all merchants" do
  it "on a particular date" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: "Thu, 29 Jun 2017 20:59:38")
    invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "Thu, 29 Jun 2017 20:59:38")
    invoice3 = create(:invoice, merchant_id: merchant1.id, created_at: "Thu, 29 Jun 2017 20:59:38")
    invoice4 = create(:invoice, merchant_id: merchant2.id, created_at: "Thu, 29 Jun 2017 20:59:38")
    invoice5 = create(:invoice, merchant_id: merchant2.id, created_at: "Thu, 29 Jun 2017 20:59:38")
    invoice6 = create(:invoice, merchant_id: merchant2.id, created_at: "Thu, 29 Jun 2017 20:59:38")

    create(:invoice_item, invoice_id: invoice1.id)
    create(:invoice_item, invoice_id: invoice1.id)
    create(:invoice_item, invoice_id: invoice2.id)
    create(:invoice_item, invoice_id: invoice2.id)
    create(:invoice_item, invoice_id: invoice2.id)
    create(:invoice_item, invoice_id: invoice3.id)
    create(:invoice_item, invoice_id: invoice3.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice4.id)
    create(:invoice_item, invoice_id: invoice5.id)
    create(:invoice_item, invoice_id: invoice6.id)

    create(:transaction, invoice_id: invoice1.id)
    create(:transaction, invoice_id: invoice2.id, result: "failed")
    create(:transaction, invoice_id: invoice2.id)
    create(:transaction, invoice_id: invoice3.id)
    create(:transaction, invoice_id: invoice4.id)
    create(:transaction, invoice_id: invoice5.id)
    create(:transaction, invoice_id: invoice6.id)

    get '/api/v1/merchants/revenue?date=2017-06-29 20:59:38'

    value = JSON.parse(response.body)

    expect(response).to be_success
    expect(value["total_revenue"]).to eq "11.88"
  end
end

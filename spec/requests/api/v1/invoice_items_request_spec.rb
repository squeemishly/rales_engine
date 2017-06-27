require 'rails_helper'

RSpec.describe "invoice_items" do
  it "can view all invoice_items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq 3
    expect(invoice_item).to have_key "customer_id"
    expect(invoice_item).to have_key "merchant_id"
    expect(invoice_item).to have_key "status"
    expect(invoice_item["customer_id"]).to be_a Integer
    expect(invoice_item["merchant_id"]).to be_a Integer
    expect(invoice_item["status"]).to be_a String
  end

  it "can view a single invoice_item" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to have_key "customer_id"
    expect(invoice_item).to have_key "merchant_id"
    expect(invoice_item).to have_key "status"
    expect(invoice_item["customer_id"]).to be_a Integer
    expect(invoice_item["merchant_id"]).to be_a Integer
    expect(invoice_item["status"]).to be_a String
  end
end

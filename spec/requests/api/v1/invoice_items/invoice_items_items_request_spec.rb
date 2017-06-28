require 'rails_helper'

describe "Invoice Items API" do
  it "returns an invoice associate with an invoice item" do

    item1 = create(:item)
    invoice_item1 = create(:invoice_item, item: item1)

    get "/api/v1/invoice_items/#{invoice_item1.id}/item"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end
end

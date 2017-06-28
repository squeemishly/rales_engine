require 'rails_helper'

RSpec.describe "find invoice items" do
  it "as a single item" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item1.unit_price}"
    parsed_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_item["unit_price"]).to eq invoice_item1.unit_price
    expect(response.body).to_not include invoice_item2.unit_price
  end

  it "as a group of items" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_item3 = create(:invoice_item, quantity: 6)

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item1.quantity}"
    parsed_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_response.first["quantity"]).to eq invoice_item1.quantity
  end
end

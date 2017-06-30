require 'rails_helper'

RSpec.describe "find a random invoice_item" do
  it "when the url contains random" do
    create_list(:invoice_item, 10)

    get '/api/v1/invoice_items/random.json'
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to have_key "id"
    expect(invoice_item).to have_key "invoice_id"
    expect(invoice_item).to have_key "item_id"
    expect(invoice_item).to have_key "quantity"
    expect(invoice_item).to have_key "unit_price"
  end
end

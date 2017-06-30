require 'rails_helper'

RSpec.describe "find a random invoice" do
  it "when you give a random parameter" do
    invoices = create_list(:invoice, 10)

    get '/api/v1/invoices/random.json'
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to have_key "id"
    expect(invoice).to have_key "status"
    expect(invoice).to have_key "customer_id"
    expect(invoice).to have_key "merchant_id"
  end
end

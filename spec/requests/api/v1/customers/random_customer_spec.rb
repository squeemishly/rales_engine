require 'rails_helper'

RSpec.describe "find a random customer" do
  it "when the url contains random" do
    create_list(:customer, 10)

    get '/api/v1/customers/random.json'
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to have_key "id"
    expect(invoice_item).to have_key "first_name"
    expect(invoice_item).to have_key "last_name"
  end
end

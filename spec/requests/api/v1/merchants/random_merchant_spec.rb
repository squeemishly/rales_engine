require 'rails_helper'

RSpec.describe "find a random merchant" do
  it "when the url contains random" do
    create_list(:merchant, 10)

    get '/api/v1/merchants/random.json'
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to have_key "id"
    expect(invoice_item).to have_key "name"
  end
end

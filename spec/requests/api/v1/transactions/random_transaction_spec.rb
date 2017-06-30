require 'rails_helper'

RSpec.describe "find a random transaction" do
  it "when the url contains random" do
    create_list(:transaction, 10)

    get '/api/v1/transactions/random.json'
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to have_key "id"
    expect(invoice_item).to have_key "credit_card_number"
    expect(invoice_item).to have_key "result"
    expect(invoice_item).to have_key "invoice_id"
  end
end

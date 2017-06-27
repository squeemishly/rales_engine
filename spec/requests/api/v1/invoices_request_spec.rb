require 'rails_helper'

RSpec.describe "invoices API" do
  it "creates a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(invoices.count).to eq 3
    expect(invoice).to have_key "name"
    expect(invoice["name"]).to be_a String
  end

  it "can show a single invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}"

    invoice_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_response["id"]).to eq invoice.id
    expect(invoice_response["name"]).to eq invoice.name
  end
end

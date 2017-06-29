require 'rails_helper'

describe "Invoice API" do
    it "returns a collection of associated customers" do
    customer_1 = create(:customer)
    invoice_1 = create(:invoice, customer: customer_1)

    get "/api/v1/invoices/#{invoice_1.id}/customer"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq("Mia")
    expect(customer["last_name"]).to eq("Jaeger")
  end
end

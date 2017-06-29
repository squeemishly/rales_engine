require 'rails_helper'

describe "Invoice API" do
    xit "returns a collection of associated customers" do
    customer_1 = create(:customer)
    invoice_1 = create(:invoice, customer: customer_1)

    get "/api/v1/invoices/#{invoice_1.id}/customers"
    expect(response).to be_success

    customers = JSON.parse(response.body)
    expect(customers["result"]).to eq("success")
  end
end

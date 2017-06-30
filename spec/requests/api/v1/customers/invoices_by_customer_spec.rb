require 'rails_helper'

RSpec.describe "a list of invoices" do
  it "seen for a particular customer" do
    customer1 = create(:customer_with_invoices, id: 100000)
    customer2 = create(:customer_with_invoices, id: 200000)

    get "/api/v1/customers/#{customer1.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.body).to include(customer1.invoices.first.id.to_s)
    expect(response.body).to include(customer1.invoices.last.id.to_s)
    expect(response.body).to_not include(customer2.invoices.first.id.to_s)
    expect(response.body).to_not include(customer2.invoices.last.id.to_s)
  end
end

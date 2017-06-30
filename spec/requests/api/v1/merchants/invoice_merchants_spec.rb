require 'rails_helper'

RSpec.describe "a list of invoices associated with a merchant can be found" do
  it "when a user gives a specific merchant" do
    merchant1 = create(:merchants_with_invoices)
    merchant2 = create(:merchants_with_invoices)

    get "/api/v1/merchants/#{merchant1.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.body).to include(merchant1.invoices.first.id.to_s)
    expect(response.body).to include(merchant1.invoices.last.id.to_s)
    expect(response.body).to_not include(merchant2.invoices.first.id.to_s)
    expect(response.body).to_not include(merchant2.invoices.last.id.to_s)
  end
end

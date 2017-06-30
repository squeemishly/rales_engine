require 'rails_helper'

RSpec.describe Invoice do
  it "responds to items" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:items)
  end

  it "responds to transactions" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:transaction)
  end

  it "responds to customer" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:customer)
  end

  it "responds to merchant" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:merchant)
  end

  it "has the appropriate fields" do
    invoice = create(:invoice)
    expect(invoice.attributes).to include("id")
    expect(invoice.attributes).to include("status")
    expect(invoice.attributes).to include("customer_id")
    expect(invoice.attributes).to include("merchant_id")
  end
end

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
end

require 'rails_helper'

RSpec.describe InvoiceItem do
  it "responds to invoices" do
    invoice_item = create(:invoice_item)
    expect(invoice_item).to respond_to(:invoice)
  end

  it "responds to items" do
    invoice_item = create(:invoice_item)
    expect(invoice_item).to respond_to(:item)
  end

  it "has the appropriate fields" do
    invoice_item = create(:invoice_item)
    expect(invoice_item.attributes).to include("invoice_id")
    expect(invoice_item.attributes).to include("quantity")
    expect(invoice_item.attributes).to include("item_id")
    expect(invoice_item.attributes).to include("unit_price")
  end
end

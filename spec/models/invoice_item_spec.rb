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
end

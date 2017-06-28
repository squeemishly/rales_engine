require 'rails_helper'

RSpec.describe Item do
  it "responds to invoices" do
    item = create(:item)
    expect(item).to respond_to(:invoices)
  end

  it "responds to merchants" do
    item = create(:item)
    expect(item).to respond_to(:merchant)
  end
end

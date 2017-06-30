require 'rails_helper'

RSpec.describe Item do
  context "relationships" do
    subject(:item) { create(:item) }

    it "responds to invoices" do
      expect(item).to respond_to(:invoices)
    end

    it "responds to merchants" do
      expect(item).to respond_to(:merchant)
    end
  end

  context "attributes" do
    it "has the appropriate attributes" do
      item = create(:item)
      expect(item.attributes).to include("id")
      expect(item.attributes).to include("merchant_id")
      expect(item.attributes).to include("name")
      expect(item.attributes).to include("unit_price")
      expect(item.attributes).to include("description")
    end
  end
end

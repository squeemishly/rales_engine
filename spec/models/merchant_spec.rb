require 'rails_helper'

  RSpec.describe Merchant, type: :model do
    context "relationships" do
      it "has many items" do
        merchant = create(:merchant)
        expect(merchant).to respond_to(:items)
      end

      it "has many invoices" do
        merchant = create(:merchant)
        expect(merchant).to respond_to(:invoices)
      end
    end

    context "attributes" do
      it "has the appropriate attributes" do
        merchant = create(:merchant)
        expect(merchant.attributes).to include("id")
        expect(merchant.attributes).to include("name")
      end
    end
  end

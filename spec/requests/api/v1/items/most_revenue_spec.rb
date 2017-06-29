require 'rails_helper'

RSpec.describe "find the top items that produce the most revenue" do
  it "by the items sales" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)

    create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id)
    create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id)
    create(:invoice_item, item_id: item3.id, invoice_id: invoice1.id)
    create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id)
    create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id)
    create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id)
    create(:invoice_item, item_id: item3.id, invoice_id: invoice2.id)
    create(:invoice_item, item_id: item1.id, invoice_id: invoice3.id)
    create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id)

    create(:transaction, invoice_id: invoice1.id, result: "failed")
    create(:transaction, invoice_id: invoice1.id)
    create(:transaction, invoice_id: invoice2.id)
    create(:transaction, invoice_id: invoice3.id)

    get '/api/v1/items/most_revenue?quantity=1'

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["id"]).to eq item1.id
  end
end

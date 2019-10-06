require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    @customer_1 = create(:customer)

    @merchant_1 = create(:merchant)
      @item_1 = create(:item, merchant: @merchant_1)
      @item_2 = create(:item, merchant: @merchant_1)
      @item_3 = create(:item, merchant: @merchant_1)

    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_items_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1)
      @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_1)

    @invoice_2 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_item_3 = create(:invoice_item, item: @item_3, invoice: @invoice_2)
  end

  it "can return all a merchant's items" do

    get "/api/v1/merchants/#{@merchant_1.id}/items"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"][0]["attributes"].count).to eq(5)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@item_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@item_2.id)
    expect(json_response["data"][2]["attributes"]["id"]).to eq(@item_3.id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(@item_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(@item_2.name)
    expect(json_response["data"][2]["attributes"]["name"]).to eq(@item_3.name)
  end

  it "can return all a merchant's invoices" do

    get "/api/v1/merchants/#{@merchant_1.id}/invoices"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"].count).to eq(4)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_2.id)
  end
end

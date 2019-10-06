require 'rails_helper'

describe "Invoice Items Record Endpoints" do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @customer_4 = create(:customer)

    @merchant_1 = create(:merchant)
      @item_1 = create(:item, merchant: @merchant_1, unit_price: 1000)
      @item_2 = create(:item, merchant: @merchant_1, unit_price: 2000)
      @item_3 = create(:item, merchant: @merchant_1, unit_price: 3000)

    @merchant_2 = create(:merchant)
      @item_4 = create(:item, merchant: @merchant_2, unit_price: 1000)
      @item_5 = create(:item, merchant: @merchant_2, unit_price: 2000)
      @item_6 = create(:item, merchant: @merchant_2, unit_price: 3000)

    @merchant_3 = create(:merchant)
      @item_7 = create(:item, merchant: @merchant_3, unit_price: 1000)
      @item_8 = create(:item, merchant: @merchant_3, unit_price: 2000)
      @item_9 = create(:item, merchant: @merchant_3, unit_price: 3000)

    @merchant_4 = create(:merchant)
      @item_10 = create(:item, merchant: @merchant_4, unit_price: 1000)

    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_items_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_items_2 = create(:invoice_item, item: @item_2, invoice: @invoice_1, quantity: 1, unit_price: @item_2.unit_price)
      @invoice_items_3 = create(:invoice_item, item: @item_3, invoice: @invoice_1, quantity: 1, unit_price: @item_3.unit_price)

    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_2)
      @invoice_items_4 = create(:invoice_item, item: @item_4, invoice: @invoice_2, quantity: 2, unit_price: @item_4.unit_price)
      @invoice_items_5 = create(:invoice_item, item: @item_5, invoice: @invoice_2, quantity: 2, unit_price: @item_5.unit_price)
      @invoice_items_6 = create(:invoice_item, item: @item_6, invoice: @invoice_2, quantity: 2, unit_price: @item_6.unit_price)

    @invoice_3 = create(:invoice, customer: @customer_3, merchant: @merchant_3)
      @invoice_items_7 = create(:invoice_item, item: @item_7, invoice: @invoice_3, quantity: 1, unit_price: @item_7.unit_price)

    @invoice_4 = create(:invoice, customer: @customer_4, merchant: @merchant_4)
      @invoice_items_8 = create(:invoice_item, item: @item_10, invoice: @invoice_4, quantity: 2, unit_price: @item_10.unit_price)

    @invoice_5 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_items_9 = create(:invoice_item, item: @item_1, invoice: @invoice_5, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_items_10 = create(:invoice_item, item: @item_2, invoice: @invoice_5, quantity: 1, unit_price: @item_2.unit_price)

    @invoice_items = [@invoice_items_1, @invoice_items_2,
                      @invoice_items_3, @invoice_items_4,
                      @invoice_items_5, @invoice_items_6,
                      @invoice_items_7, @invoice_items_8,
                      @invoice_items_9, @invoice_items_10]

    @expected_attributes = [ "id",
                            "item_id",
                            "invoice_id",
                            "quantity",
                            "unit_price" ]
  end

  it "can return all invoice_items" do

    get "/api/v1/invoice_items"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(10)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"][0]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"][0]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_items[1].id)
    expect(json_response["data"][1]["attributes"]["item_id"]).to eq(@invoice_items[1].item_id)
    expect(json_response["data"][1]["attributes"]["invoice_id"]).to eq(@invoice_items[1].invoice_id)
    expect(json_response["data"][9]["attributes"]["id"]).to eq(@invoice_items[9].id)
    expect(json_response["data"][9]["attributes"]["item_id"]).to eq(@invoice_items[9].item_id)
    expect(json_response["data"][9]["attributes"]["invoice_id"]).to eq(@invoice_items[9].invoice_id)
  end

  it "can return a single invoice_item" do

    get "/api/v1/invoice_items/#{@invoice_items[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice_item by id" do

    get "/api/v1/invoice_items/find?id=#{@invoice_items[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice_item by item_id" do

    get "/api/v1/invoice_items/find?item_id=#{@item_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice by invoice_id" do

    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice_item by quantity" do

    get "/api/v1/invoice_items/find?quantity=#{@invoice_items[0].quantity}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice_item by unit_price" do

    get "/api/v1/invoice_items/find?unit_price=#{@invoice_items[0].unit_price}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice_item by created_at" do

    get "/api/v1/invoice_items/find?created_at=#{@invoice_items[0].created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find a single invoice_item by updated_at" do

    get "/api/v1/invoice_items/find?updated_at=#{@invoice_items[0].updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_items[0].id)
    expect(json_response["data"]["attributes"]["item_id"]).to eq(@invoice_items[0].item_id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@invoice_items[0].invoice_id)
    expect(json_response["data"]["attributes"]["quantity"]).to eq(@invoice_items[0].quantity)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("10.00")
  end

  it "can find multiple invoice_items by item_id" do

    get "/api/v1/invoice_items/find_all?item_id=#{@item_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_items_1.id)
    expect(json_response["data"][0]["attributes"]["item_id"]).to eq(@item_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_items_9.id)
    expect(json_response["data"][1]["attributes"]["item_id"]).to eq(@item_1.id)
  end

  it "can find multiple invoice_items by invoice_id" do

    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_items_1.id)
    expect(json_response["data"][0]["attributes"]["invoice_id"]).to eq(@invoice_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_items_2.id)
    expect(json_response["data"][1]["attributes"]["invoice_id"]).to eq(@invoice_1.id)
    expect(json_response["data"][2]["attributes"]["id"]).to eq(@invoice_items_3.id)
    expect(json_response["data"][2]["attributes"]["invoice_id"]).to eq(@invoice_1.id)
  end

  it "can find multiple invoice_items by quantity" do

    get "/api/v1/invoice_items/find_all?quantity=2"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_items_4.id)
    expect(json_response["data"][0]["attributes"]["quantity"]).to eq(@invoice_items_4.quantity)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_items_5.id)
    expect(json_response["data"][1]["attributes"]["quantity"]).to eq(@invoice_items_5.quantity)
    expect(json_response["data"][2]["attributes"]["id"]).to eq(@invoice_items_6.id)
    expect(json_response["data"][2]["attributes"]["quantity"]).to eq(@invoice_items_6.quantity)
    expect(json_response["data"][3]["attributes"]["id"]).to eq(@invoice_items_8.id)
    expect(json_response["data"][3]["attributes"]["quantity"]).to eq(@invoice_items_8.quantity)
  end

  it "can find multiple invoice_items by created_at" do

    customer_1 = create(:customer)
    merchant_1 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer_1)
      invoice_items_1 = create(:invoice_item, item: item_1, invoice: invoice_1, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer_1)
      invoice_items_2 = create(:invoice_item, item: item_1, invoice: invoice_2, created_at: "Mon, 05 Sep 2019 21:13:03 UTC +00:00")
    invoice_3 = create(:invoice, merchant: merchant_1, customer: customer_1)
      invoice_items_3 = create(:invoice_item, item: item_1, invoice: invoice_3, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/invoice_items/find_all?created_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(invoice_items_1.id)
    expect(json_response["data"][0]["attributes"]["item_id"]).to eq(invoice_items_1.item_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(invoice_items_3.id)
    expect(json_response["data"][1]["attributes"]["item_id"]).to eq(invoice_items_1.item_id)
  end

  it "can find multiple invoice_items by updated_at" do

    customer_1 = create(:customer)
    merchant_1 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer_1)
      invoice_items_1 = create(:invoice_item, item: item_1, invoice: invoice_1, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer_1)
      invoice_items_2 = create(:invoice_item, item: item_1, invoice: invoice_2, updated_at: "Mon, 05 Sep 2019 21:13:03 UTC +00:00")
    invoice_3 = create(:invoice, merchant: merchant_1, customer: customer_1)
      invoice_items_3 = create(:invoice_item, item: item_1, invoice: invoice_3, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/invoice_items/find_all?updated_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(invoice_items_1.id)
    expect(json_response["data"][0]["attributes"]["item_id"]).to eq(invoice_items_1.item_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(invoice_items_3.id)
    expect(json_response["data"][1]["attributes"]["item_id"]).to eq(invoice_items_1.item_id)
  end

  it "can return a random invoice" do

    get "/api/v1/invoice_items/random"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"].keys).to eq(["id", "type", "attributes"])
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
  end
end

require 'rails_helper'

describe "Items Record Endpoints" do
  before :each do
    @merchant = create(:merchant, id: 500)
    @item_1 = create(:item, merchant: @merchant, unit_price: "10000")
    @item_2 = create(:item, merchant: @merchant, unit_price: "20000")
    @item_3 = create(:item, merchant: @merchant, unit_price: "30000")
    @items = [@item_1, @item_2, @item_3]
    @expected_attributes = ["id",
                            "merchant_id",
                            "name",
                            "description",
                            "unit_price"]
  end

  it "can return all items" do

    get "/api/v1/items"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"][0]["attributes"]["description"]).to eq(@items[0].description)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@items[1].id)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(@items[1].name)
    expect(json_response["data"][1]["attributes"]["description"]).to eq(@items[1].description)
  end

  it "can return a single item" do

    get "/api/v1/items/#{@items[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["description"]).to eq(@items[0].description)
  end

  it "can find a single item by id" do
    get "/api/v1/items/find?id=#{@items[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["description"]).to eq(@items[0].description)
  end

  it "can find a single item by merchant_id" do

    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_1)
    item_3 = create(:item, merchant: merchant_2)
    item_4 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find?merchant_id=#{merchant_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)


    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(item_1.id)
    expect(json_response["data"]["attributes"]["name"]).to eq(item_1.name)
    expect(json_response["data"]["attributes"]["description"]).to eq(item_1.description)
  end

  it "can find a single item by name" do

    get "/api/v1/items/find?name=#{@items[0].name}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["description"]).to eq(@items[0].description)
  end

  it "can find a single item by description" do

    get "/api/v1/items/find?description=#{@items[0].description}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["description"]).to eq(@items[0].description)
  end

  it "can find a single item by unit_price" do

    get "/api/v1/items/find?unit_price=#{@items[0].unit_price}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["unit_price"]).to eq("100.00")
  end

  it "can find a single item by created_at" do

    get "/api/v1/items/find?created_at=#{@items[0].created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["description"]).to eq(@items[0].description)
  end

  it "can find a single item by updated_at" do

    get "/api/v1/items/find?updated_at=#{@items[0].updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@items[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@items[0].name)
    expect(json_response["data"]["attributes"]["description"]).to eq(@items[0].description)
  end

  it "can find multiple items by merchant_id" do

    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_1)
    item_3 = create(:item, merchant: merchant_2)
    item_4 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find_all?merchant_id=#{merchant_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(json_response["data"][0]["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(item_2.id)
    expect(json_response["data"][1]["attributes"]["merchant_id"]).to eq(merchant_1.id)
  end

  it "can find multiple items by name" do

    merchant_1 = create(:merchant)

    item_1 = create(:item, name: "Item_1", merchant: merchant_1)
    item_2 = create(:item, name: "Item_1", merchant: merchant_1)
    item_3 = create(:item, name: "Item_2", merchant: merchant_1)

    get "/api/v1/items/find_all?name=Item_1"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(item_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(item_2.name)
  end

  it "can find multiple items by description" do

    merchant_1 = create(:merchant)

    item_1 = create(:item, description: "Description_1", merchant: merchant_1)
    item_2 = create(:item, description: "Description_1", merchant: merchant_1)
    item_3 = create(:item, description: "Description_2", merchant: merchant_1)

    get "/api/v1/items/find_all?description=Description_1"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["description"]).to eq(item_1.description)
    expect(json_response["data"][1]["attributes"]["description"]).to eq(item_2.description)
  end

  it "can find multiple items by unit_price" do

    merchant_1 = create(:merchant)

    item_1 = create(:item, unit_price: 70000, merchant: merchant_1)
    item_2 = create(:item, unit_price: 70000, merchant: merchant_1)
    item_3 = create(:item, unit_price: 80000, merchant: merchant_1)

    get "/api/v1/items/find_all?unit_price=700.00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["unit_price"]).to eq("700.00")
    expect(json_response["data"][1]["attributes"]["unit_price"]).to eq("700.00")
  end

  it "can find multiple items by created_at" do

    merchant_1 = create(:merchant)

    item_1 = create(:item, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1)
    item_2 = create(:item, created_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1)
    item_3 = create(:item, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1)

    get "/api/v1/items/find_all?created_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(item_3.id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(item_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(item_3.name)
  end

  it "can find multiple items by updated_at" do

    merchant_1 = create(:merchant)

    item_1 = create(:item, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1)
    item_2 = create(:item, updated_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1)
    item_3 = create(:item, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1)

    get "/api/v1/items/find_all?updated_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(item_3.id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(item_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(item_3.name)
  end

  it "can return a random item" do

    get "/api/v1/items/random"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"].keys).to eq(["id", "type", "attributes"])
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
  end
end

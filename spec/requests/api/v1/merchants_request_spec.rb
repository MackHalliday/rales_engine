require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    @merchants = create_list(:merchant, 5)
  end

  it "can return all merchants" do

    get "/api/v1/merchants"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    merchant_1 = json_response["data"].first

    expect(json_response["data"].count).to eq(5)
    expect(merchant_1["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can return a single merchant" do

    get "/api/v1/merchants/#{@merchants.first.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by id" do
    get "/api/v1/merchants/find?id=#{@merchants.first.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by name" do

    get "/api/v1/merchants/find?name=#{@merchants.first.name}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by created_at" do

    get "/api/v1/merchants/find?created_at=#{@merchants.first.created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by updated_at" do

    get "/api/v1/merchants/find?updated_at=#{@merchants.first.updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find multiple merchants by name" do

    merchant_1 = create(:merchant, name: "adam")
    merchant_2 = create(:merchant, name: "adam")
    merchant_3 = create(:merchant, name: "chuck")

    get "/api/v1/merchants/find_all?NAME=adam"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(merchant_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(merchant_2.name)
  end

  it "can find multiple merchants by created_at" do

    merchant_1 = create(:merchant, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")
    merchant_2 = create(:merchant, created_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00")
    merchant_3 = create(:merchant, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/merchants/find_all?created_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(merchant_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(merchant_3.name)
  end

  it "can find multiple merchants by updated_at" do
    merchant_1 = create(:merchant, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")
    merchant_2 = create(:merchant, updated_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00")
    merchant_3 = create(:merchant, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/merchants/find_all?updated_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(merchant_1.name)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(merchant_3.name)
  end

  it "can return a random merchant" do

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"].keys).to eq(["id", "type", "attributes"])
    expect(json_response["data"]["attributes"].keys).to eq(["name"])
  end
end

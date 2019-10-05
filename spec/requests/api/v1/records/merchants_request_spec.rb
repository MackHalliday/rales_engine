require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    @merchants = create_list(:merchant, 5)
  end

  it "can return all merchants" do

    get "/api/v1/merchants"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(5)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@merchants[0].id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(@merchants[0].name)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@merchants[1].id)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(@merchants[1].name)
  end

  it "can return a single merchant" do

    get "/api/v1/merchants/#{@merchants[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"].keys).to eq(["id", "name"])
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants[0].name)
  end

  it "can find a single merchant by id" do
    get "/api/v1/merchants/find?id=#{@merchants[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants[0].name)
  end

  it "can find a single merchant by name" do

    get "/api/v1/merchants/find?name=#{@merchants[0].name}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants[0].name)
  end

  it "can find a single merchant by created_at" do

    get "/api/v1/merchants/find?created_at=#{@merchants[0].created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants[0].name)
  end

  it "can find a single merchant by updated_at" do

    get "/api/v1/merchants/find?updated_at=#{@merchants[0].updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants[0].id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants[0].name)
  end

  it "can find multiple merchants by name" do

    merchant_1 = create(:merchant, name: "Adam")
    merchant_2 = create(:merchant, name: "Adam")
    merchant_3 = create(:merchant, name: "Chuck")

    get "/api/v1/merchants/find_all?NAME=Adam"

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
    expect(json_response["data"]["attributes"].keys).to eq(["id", "name"])
  end
end

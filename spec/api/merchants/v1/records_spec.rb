require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    merchants = create_list(:merchant, 5)
  end

  it "can return all merchants" do

    visit '/api/v1/merchants'

    expect(response).to be_successful

    # json_response = JSON.parse(response.body)
    #   expect(hash_body.keys).to match_array([:id, :ingredients, :instructions])
  end

  it "can return a single merchant" do
  end

  it "can find a single merchant" do
  end

  it "can find multipl merchants" do
  end

  it "can return multiple merchants" do
  end
end

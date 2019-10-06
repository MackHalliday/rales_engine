require 'rails_helper'

describe "Invoice Relationship Endpoints" do
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
      @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_1, quantity: 1, unit_price: @item_2.unit_price)
      @invoice_item_3 = create(:invoice_item, item: @item_3, invoice: @invoice_1, quantity: 1, unit_price: @item_3.unit_price)

    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_2)
      @invoice_item_4 = create(:invoice_item, item: @item_4, invoice: @invoice_2, quantity: 2, unit_price: @item_4.unit_price)
      @invoice_item_5 = create(:invoice_item, item: @item_5, invoice: @invoice_2, quantity: 2, unit_price: @item_5.unit_price)
      @invoice_item_6 = create(:invoice_item, item: @item_6, invoice: @invoice_2, quantity: 2, unit_price: @item_6.unit_price)

    @invoice_3 = create(:invoice, customer: @customer_3, merchant: @merchant_3)
      @invoice_item_7 = create(:invoice_item, item: @item_7, invoice: @invoice_3, quantity: 1, unit_price: @item_7.unit_price)

    @invoice_4 = create(:invoice, customer: @customer_4, merchant: @merchant_4)
      @invoice_item_8 = create(:invoice_item, item: @item_10, invoice: @invoice_4, quantity: 2, unit_price: @item_10.unit_price)

    @invoice_5 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_item_9 = create(:invoice_item, item: @item_1, invoice: @invoice_5, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_item_10 = create(:invoice_item, item: @item_2, invoice: @invoice_5, quantity: 1, unit_price: @item_2.unit_price)

    @invoice_items = [@invoice_item_1, @invoice_item_2,
                      @invoice_item_3, @invoice_item_4,
                      @invoice_item_5, @invoice_item_6,
                      @invoice_item_7, @invoice_item_8,
                      @invoice_item_9, @invoice_item_10]

    @transaction_1 = create(:transaction, invoice: @invoice_1, result: "success")
    @transaction_2 = create(:transaction, invoice: @invoice_2, result: "success")
    @transaction_3 = create(:transaction, invoice: @invoice_3, result: "success", credit_card_number: "1230000000000000")
    @transaction_4 = create(:transaction, invoice: @invoice_4, result: "success", credit_card_number: "1230000000000000")
    @transaction_5 = create(:transaction, invoice: @invoice_5, result: "failed")

    @transactions = [ @transaction_1,
                      @transaction_2,
                      @transaction_3,
                      @transaction_4,
                      @transaction_5 ]
  end

  it "can return an invoice's transactions" do

    get "/api/v1/invoices/#{@invoice_1.id}/transactions"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(1)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@transaction_1.id)
    expect(json_response["data"][0]["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(json_response["data"][0]["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
  end

  it "can return an invoice's invoice_items" do

    get "/api/v1/invoices/#{@invoice_1.id}/invoice_items"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(json_response["data"][0]["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(json_response["data"][0]["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(json_response["data"][2]["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(json_response["data"][2]["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(json_response["data"][2]["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
  end

  it "can return an invoice's items" do

    get "/api/v1/invoices/#{@invoice_1.id}/items"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)


    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@item_1.id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(@item_1.name)
    expect(json_response["data"][0]["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(json_response["data"][2]["attributes"]["id"]).to eq(@item_3.id)
    expect(json_response["data"][2]["attributes"]["name"]).to eq(@item_3.name)
    expect(json_response["data"][2]["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
  end

  it "can return an invoice's customers" do

    get "/api/v1/invoices/#{@invoice_1.id}/customer"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@customer_1.id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customer_1.first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customer_1.last_name)
  end

  it "can return an invoice's merchants" do

     get "/api/v1/invoices/#{@invoice_1.id}/merchant"

     expect(response).to be_successful

     json_response = JSON.parse(response.body)

     expect(json_response["data"].count).to eq(3)
     expect(json_response["data"]["attributes"]["id"]).to eq(@merchant_1.id)
     expect(json_response["data"]["attributes"]["name"]).to eq(@merchant_1.name)
  end
end

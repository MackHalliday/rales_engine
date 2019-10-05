require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @customer_4 = create(:customer)

    @merchant_1 = create(:merchant)
      @item_1 = create(:item, merchant: @merchant_1, unit_price: 10.00)
      @item_2 = create(:item, merchant: @merchant_1, unit_price: 20.00)
      @item_3 = create(:item, merchant: @merchant_1, unit_price: 30.00)

    @merchant_2 = create(:merchant)
      @item_4 = create(:item, merchant: @merchant_2, unit_price: 10.00)
      @item_5 = create(:item, merchant: @merchant_2, unit_price: 20.00)
      @item_6 = create(:item, merchant: @merchant_2, unit_price: 30.00)

    @merchant_3 = create(:merchant)
      @item_7 = create(:item, merchant: @merchant_3, unit_price: 10.00)
      @item_8 = create(:item, merchant: @merchant_3, unit_price: 20.00)
      @item_9 = create(:item, merchant: @merchant_3, unit_price: 30.00)

    @merchant_4 = create(:merchant)
      @item_10 = create(:item, merchant: @merchant_4, unit_price: 10.00)

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
      @invoice_items_10 = create(:invoice_item, item: @item_1, invoice: @invoice_5, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_items_11 = create(:invoice_item, item: @item_2, invoice: @invoice_5, quantity: 1, unit_price: @item_2.unit_price)
  end

  it "has created all the objects" do
    binding.pry
  end
end

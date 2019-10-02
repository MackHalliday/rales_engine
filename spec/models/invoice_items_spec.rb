require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "relationships" do
    # it { should has_many :items}
    # it { should has_many :invoice}
  end

  describe "validations" do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price}
    it { should validate_presence_of :created_at }
    it { should validate_presence_of :updated_at }
  end
end

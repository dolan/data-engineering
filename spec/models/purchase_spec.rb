# == Schema Information
#
# Table name: purchases
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  quantity    :decimal(, )
#  customer_id :integer
#  merchant_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_purchases_on_customer_id  (customer_id)
#  index_purchases_on_item_id      (item_id)
#  index_purchases_on_merchant_id  (merchant_id)
#

require 'spec_helper'

describe Purchase do
  before(:each) do
    @purchase = build(:purchase)
  end

  context "validation examples" do
    it "should be valid with an item, integer quantity, merchant and a customer" do
      expect(@purchase).to be_valid
    end

    it "should not be valid without an item" do
      @purchase.item = nil
      expect(@purchase).to have(1).errors_on(:item)
    end

    it "should not be valid without a quantity" do
      @purchase.quantity = nil
      # error on both kinds of validation (numericality and presence)
      expect(@purchase).to have(2).errors_on(:quantity)
    end

    it "should not be valid with a negative quantity" do
      @purchase.quantity = -1
      expect(@purchase).to have(1).errors_on(:quantity)
    end

    it "should not be valid when quantity is a float" do
      @purchase.quantity = 1.5
      expect(@purchase).to have(1).errors_on(:quantity)
    end

    it "should not be valid without a merchant" do
      @purchase.merchant = nil
      expect(@purchase).to have(1).errors_on(:merchant)
    end

    it "should not be valid without a customer" do
      @purchase.customer = nil
      expect(@purchase).to have(1).errors_on(:customer)
    end
  end

  context "instance method" do
    it ":purchase_amount should return the total revenue for the purchase" do
      amount = @purchase.purchase_amount
      expected_amount = @purchase.quantity * @purchase.item.price
      expect(amount).to eq(expected_amount)
    end
  end
end

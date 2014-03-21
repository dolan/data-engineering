require 'spec_helper'

describe Purchase do
  context "validation examples" do
    it "should be valid with an item, integer quantity, merchant and a customer"
    it "should not be valid without an item"
    it "should not be valid without a quantity"
    it "should not be valid with a negative quantity"
    it "should not be valid when quantity is a float"
    it "should not be valid without a merchant"
    it "should not be valid without a customer"
  end

  context "instance method" do
    it ":total_amount should return the total revenue for the purchase"
  end
end

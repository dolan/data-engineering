# == Schema Information
#
# Table name: merchants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_merchants_on_name  (name)
#

require 'spec_helper'

describe Merchant do
  before(:each) do
    @merchant = build(:merchant)
  end
  
  context "validation examples" do
    it "should be valid with a name and an address" do
      expect(@merchant).to be_valid
    end
    it "should not be valid without a name" do
      @merchant.name = nil
      expect(@merchant).to have(1).errors_on(:name)
    end
    it "should not be valid without an address" do
      @merchant.address = nil
      expect(@merchant).to have(1).errors_on(:address)
    end
  end
end

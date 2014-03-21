# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  description :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_items_on_description  (description)
#

require 'spec_helper'

describe Item do
  before(:each) do
    @item = build(:item)
  end

  context "validation examples" do
    it "should be valid with a description and a positive price" do
      expect(@item).to be_valid
    end
    it "should not be valid without a description" do
      @item.description = nil
      expect(@item).to have(1).errors_on(:description)
    end
    it "should not be valid without a price" do
      @item.price = nil
      expect(@item).to have_at_least(1).errors_on(:price)
    end
    it "should not be valid with a negative price" do
      @item.price = BigDecimal.new("-3.50")
      expect(@item).to have(1).errors_on(:price)
    end
  end
end

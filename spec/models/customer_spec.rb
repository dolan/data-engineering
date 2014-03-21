# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_customers_on_name  (name)
#

require 'spec_helper'

describe Customer do

  before(:each) do
    @customer = build(:customer)
  end

  context "validation examples" do
    it "should be valid with a name" do
      expect(@customer).to be_valid
    end

    it "should not be valid without a name" do
      @customer.name = nil
      expect(@customer).to have(1).errors_on(:name)
    end
  end
end

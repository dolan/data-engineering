# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  street           :string(255)
#  city             :string(255)
#  region           :string(255)
#  postal_code      :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_addresses_on_addressable_id    (addressable_id)
#  index_addresses_on_addressable_type  (addressable_type)
#  index_addresses_on_city              (city)
#  index_addresses_on_postal_code       (postal_code)
#  index_addresses_on_region            (region)
#

require 'spec_helper'

describe Address do
  before(:each) do
    @address = build(:address)
  end

  context "validation examples" do
    it "should be valid with a street address" do
      expect(@address).to be_valid
    end

    it "should not be valid without a street address" do
      @address.street = nil
      expect(@address).to have(1).errors_on(:street)
    end
  end
end

require 'spec_helper'

describe Item do
  context "validation examples" do
    it "should be valid with a description and a positive price"
    it "should not be valid without a description"
    it "should not be valid without a price"
    it "should not be valid with a negative price"
  end
end

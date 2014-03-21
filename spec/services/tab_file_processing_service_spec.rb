require 'spec_helper'

describe TabFileProcessingService do
  context "initializer" do
    it "creates an instance when passed a data_file_upload object"
    it "creates an instance when passed a data_file_upload id"
  end

  context "instance method" do
    describe ":process parses the file and creates the normalized data" do
      it "processes the file"
      it "creates the proper number of purchase items"
      it "does not duplicate items"
      it "does not duplicate merchants"
      it "does not duplicate customers"
      it "will not process the same file twice"
      it "will set the total income for the data file"
    end
  end
end

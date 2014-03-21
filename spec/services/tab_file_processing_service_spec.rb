require 'spec_helper'

describe TabFileProcessingService do

  before(:each) do
    @data_file_upload = create(:data_file_upload)
    @tab_file_processing_service = TabFileProcessingService.new(@data_file_upload)
  end
  context "initializer" do
    it "creates an instance when passed a data_file_upload object" do
      @service = TabFileProcessingService.new(@data_file_upload)
      expect(@service).not_to be_nil
    end
    it "creates an instance when passed a data_file_upload id" do
      @service = TabFileProcessingService.new(@data_file_upload.id)
      expect(@service).not_to be_nil
    end
  end

  context "instance method" do
    describe ":process parses the file and creates the normalized data" do

      it "sets the processed_at time stamp on the upload object" do

        expect(@data_file_upload.processed_at).to be_nil

        @tab_file_processing_service.process
        expect(@data_file_upload.processed_at).not_to be_nil
      end

      it "processes the file" do
        result = @tab_file_processing_service.process
        expect(result.length).to be > 0
      end

      it "creates the proper number of purchase items" do
        expected_count = 4 # sample file has 4 items
        result = @tab_file_processing_service.process
        expect(result.length).to eq(expected_count)
      end

      it "does not duplicate items" do

        # the sample input data has two line items for this product
        item_string = "$20 Sneakers for $5"
        result = @tab_file_processing_service.process

        # should still be in the database only once
        expect(Item.where(description: item_string).count).to eq(1)
      end

      it "does not duplicate merchants" do

        # the sample input data has two line items from this merchant
        merchant_string = "Sneaker Store Emporium"
        result = @tab_file_processing_service.process

        # should still be in the database only once
        expect(Merchant.where(name: merchant_string).count).to eq(1)
      end

      it "does not duplicate customers" do

        # the sample input data has two line items from this customer
        customer_string = "Snake Plissken"
        result = @tab_file_processing_service.process

        # should still be in the database only once
        expect(Customer.where(name: customer_string).count).to eq(1)
      end

      it "will not process the same file twice" do
        first_result = @tab_file_processing_service.process # first pass
        second_result = @tab_file_processing_service.process # second pass
        expect(second_result.length).to eq(0)
      end

      it "will set the total income for the data file" do
        initial_value = @data_file_upload.total_income
        @tab_file_processing_service.process
        new_value = @data_file_upload.total_income
        expect(new_value).to be > initial_value
      end
    end
  end
end

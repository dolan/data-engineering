# == Schema Information
#
# Table name: data_file_uploads
#
#  id           :integer          not null, primary key
#  note         :string(255)      default("Uploaded file")
#  data_file    :string(255)
#  total_income :decimal(, )      default(0.0)
#  created_at   :datetime
#  updated_at   :datetime
#  processed_at :datetime
#

require 'spec_helper'

describe DataFileUpload do

  before(:each) do
    @data_file_upload = build(:data_file_upload)
  end

  context "validation examples" do
    it "should be valid with a file and note" do
      expect(@data_file_upload).to be_valid
    end
    it "should not be valid without a note" do
      @data_file_upload.note = nil
      expect(@data_file_upload).to have(1).errors_on(:note)
    end
  end
end

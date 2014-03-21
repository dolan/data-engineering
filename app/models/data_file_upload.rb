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
#

class DataFileUpload < ActiveRecord::Base
  validates :note, presence: true
  validates :data_file, presence: true
end

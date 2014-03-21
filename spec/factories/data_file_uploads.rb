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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_file_upload do
    note "An uploaded file"
    data_file { fixture_file_upload("test_file.tab") }
    total_income "9.99"
  end
end

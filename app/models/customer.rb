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

class Customer < ActiveRecord::Base
  validates :name, presence: true
end

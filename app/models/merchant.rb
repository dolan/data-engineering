# == Schema Information
#
# Table name: merchants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_merchants_on_name  (name)
#

class Merchant < ActiveRecord::Base
  has_one :address, as: :addressable, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  accepts_nested_attributes_for :address
end

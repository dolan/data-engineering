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

class Address < ActiveRecord::Base
  validates :street, presence: true
  belongs_to :addressable, polymorphic: true
end

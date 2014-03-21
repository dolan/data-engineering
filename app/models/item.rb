# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  description :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_items_on_description  (description)
#

class Item < ActiveRecord::Base
end

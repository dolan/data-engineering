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
  validates :description, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}

  # HACK: to allow simple form to pick this up
  def name
    "#{description} ($#{price.round(2)})"
  end
end

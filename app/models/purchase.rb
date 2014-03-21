# == Schema Information
#
# Table name: purchases
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  quantity    :decimal(, )
#  customer_id :integer
#  merchant_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_purchases_on_customer_id  (customer_id)
#  index_purchases_on_item_id      (item_id)
#  index_purchases_on_merchant_id  (merchant_id)
#

class Purchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :customer
  belongs_to :merchant
  validates :item, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :customer, presence: true
  validates :merchant, presence: true

  def purchase_amount
    quantity * item.price
  end
end

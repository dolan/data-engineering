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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    item
    quantity "9.99"
    customer
    merchant
  end
end

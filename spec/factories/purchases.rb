# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    item
    quantity "9.99"
    customer
    merchant
  end
end

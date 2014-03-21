# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "123 Rodeo Drive"
    city "Beverly Hills"
    region "CA"
    postal_code "90210"
  end
end

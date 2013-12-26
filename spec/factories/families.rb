# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :family do
    name "Smiths"
    address "123 Main St"
    city "Woodinville"
    state "WA"
    zip "98072"
    county "King"
    church "ABC"
    licensed false
    licensed_date "2013-12-15"
    provider_id "12345"
  end
end

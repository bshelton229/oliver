# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :case_manager do
    first_name "Charles"
    last_name "Dickens"
    phone "555-123"
    email "charles@dickens.org"
  end
end

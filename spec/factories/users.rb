# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'admin@email.com'
    password 'testpassword'
  end
end

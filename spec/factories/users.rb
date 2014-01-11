# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Paul"
    last_name "Dornfeld"
    email "pd@example.com"
    password "123456789"
  end
end

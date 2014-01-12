# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Paul"
    last_name "Dornfeld"
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password "123456789"
  end
end

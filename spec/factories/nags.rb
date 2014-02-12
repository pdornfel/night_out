# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nag do
    body "Hey, Im nagging you!"
    user
    group
  end
end

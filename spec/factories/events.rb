# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    group_id 1
    time "2014-01-12 10:25:42"
  end
end

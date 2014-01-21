# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote, :class => 'Votes' do
    user_id 1
    proposed_location_id 1
  end
end

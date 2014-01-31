class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  belongs_to :proposed_location

  validates_uniqueness_of :user_id, scope: :event_id

end

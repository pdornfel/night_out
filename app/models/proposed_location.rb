class ProposedLocation < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :event

  belongs_to :event
end

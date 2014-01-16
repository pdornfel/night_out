class Event < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :time

  belongs_to :group
  has_many :proposed_locations

end

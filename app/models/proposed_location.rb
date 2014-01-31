class ProposedLocation < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :event

  belongs_to :event

  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
end

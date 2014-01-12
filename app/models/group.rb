class Group < ActiveRecord::Base

  validates_presence_of :name

  has_many :memberships,
    inverse_of: :group

  has_many :users, through: :memberships,
    inverse_of: :groups

end

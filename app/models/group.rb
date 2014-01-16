class Group < ActiveRecord::Base

  validates_presence_of :name

  has_many :memberships,
    inverse_of: :group,
    dependent: :destroy

  has_many :users, through: :memberships,
    inverse_of: :groups,
    foreign_key: 'creator_id'

    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

    has_many :events, dependent: :destroy

end

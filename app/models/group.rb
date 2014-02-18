class Group < ActiveRecord::Base

  has_many :comments, as: :commentable,
    dependent: :destroy

  validates_presence_of :name

  has_many :memberships,
    inverse_of: :group,
    dependent: :destroy

  has_many :users, through: :memberships,
    inverse_of: :groups,
    foreign_key: 'creator_id'

    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

    has_many :events,
      dependent: :destroy

    has_many :nags,
      inverse_of: :group,
      dependent: :destroy

    def last_nag_time
      last_nag = nags.last.try(:created_at)
      unless last_nag == nil
        last_nag.strftime('%B %d, %Y at %I:%M %P')
      end
    end

    def last_nag_creator
      nags.last.try(:user).try(:first_name).try(:capitalize)
    end

end

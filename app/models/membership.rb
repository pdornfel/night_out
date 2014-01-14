class Membership < ActiveRecord::Base

  belongs_to :user,
    inverse_of: :memberships

  belongs_to :group,
    inverse_of: :memberships

  validates_presence_of :user
  validates_presence_of :group

  validates_uniqueness_of :user_id, scope: :group_id, message: 'User already exists in that group'



  # setter dummy method
  def email=(email)
    self.user = User.where(email: email).first
  end

  # getter dummy method - allows form to render
  def email
    self.user.try(:email)
  end

end


# User.create! do |user|
#   user.email = 'joe@example.com'
# end

# membership = Membership.new
# membership.email = 'dan.pickett@gmail.com'

# membership.user

# membership = Membership.new
# membership.email = 'joe@example.com'
# membership.user

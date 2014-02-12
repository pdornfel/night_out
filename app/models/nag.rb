class Nag < ActiveRecord::Base
  validates_presence_of :body

  belongs_to :group
  belongs_to :user

end

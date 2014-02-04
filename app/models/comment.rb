class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  validates_presence_of :user
  validates_presence_of :event
  validates_presence_of :body

  def author
    user.first_name
  end

end
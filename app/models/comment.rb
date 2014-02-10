class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true

  belongs_to :user

  validates_presence_of :body
  validates_presence_of :user
  validates_presence_of :commentable_type
  validates_presence_of :commentable_id

  def author
    user
  end

end
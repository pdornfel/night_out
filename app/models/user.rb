class User < ActiveRecord::Base

  has_many :memberships,
    inverse_of: :user,
    dependent: :destroy

  has_many :groups, through: :memberships,
    inverse_of: :users,
    dependent: :destroy


  validates_presence_of :first_name
  validates_presence_of :last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

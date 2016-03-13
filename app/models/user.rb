class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end

class User < ApplicationRecord
  has_many :articles
  
  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Follow
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  def follow(user)
    active_follows.create(followed_id: user.id)
  end

  def unfollow(selfuser, user)
    active_follows.find_by(follower_id: selfuser.id, followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end

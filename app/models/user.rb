class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :project_data, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name:"Relationship", foregin_key:"follower_id", dependent: :destroy
  has_many :followed, class_name:"Relationship", foregin_key:"followed_id", dependent: :destroy

  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
  	follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
  	follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
  	following_user.include?(user)
  end

  attachment :image, destroy: false


end

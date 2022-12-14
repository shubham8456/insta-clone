class User < ApplicationRecord
  mount_uploader :profile_image, ProfileImageUploader

  validates :user_name, uniqueness: true
  validates :first_name, :last_name, :user_name, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Following associations for Follow feature has been taken from 
  # https://betterprogramming.pub/how-to-create-a-follow-feature-in-rails-by-aliasing-associations-30d63edee284
  # very nice explanation

   # Will return an array of follows for the given user instance
   has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow'

   # Will return an array of users who follow the user instance
   has_many :followers, through: :received_follows, source: :follower
 
   # returns an array of follows a user gave to someone else
   has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow'
   
   # returns an array of other users who the user has followed
   has_many :followings, through: :given_follows, source: :followed_user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_requests, foreign_key: "friender_id"
  has_many :accepted_friend_requests, -> { where(status: true) }, foreign_key: "friender_id", class_name: "FriendRequest"
  has_many :friends, through: :accepted_friend_requests, source: :friendee

  has_many :posts
end

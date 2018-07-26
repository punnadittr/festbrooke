class User < ApplicationRecord
  has_many  :received_friend_requests, 
            :foreign_key => 'recipient_id', 
            :class_name => 'FriendRequest', 
            :dependent => :destroy
            
  has_many  :sent_friend_requests, 
            :foreign_key => 'sender_id', 
            :class_name => 'FriendRequest', 
            :dependent => :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: :true
  validates :name, presence: :true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :omniauthable, :validatable

  def feed
    friend_ids = "SELECT friend_id FROM friendships
                      WHERE user_id = :user_id"
    Post.where("user_id IN (#{friend_ids})
    OR user_id = :user_id", user_id: id)
  end
end

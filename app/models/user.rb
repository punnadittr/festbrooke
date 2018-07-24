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
  has_many :likes

  validates :email, presence: :true
  validates :name, presence: :true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :omniauthable, :validatable
end

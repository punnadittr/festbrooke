class User < ApplicationRecord
  
  after_commit :add_default_avatar, on: [:create, :update]

  paginates_per 25

  has_many  :received_friend_requests, 
            :foreign_key => 'recipient_id', 
            :class_name => 'FriendRequest', 
            :dependent => :destroy
            
  has_many  :sent_friend_requests, 
            :foreign_key => 'sender_id', 
            :class_name => 'FriendRequest', 
            :dependent => :destroy

  has_one_attached :avatar, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: :true
  validates :name, presence: :true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  def shorten_name(length)
    if self.name.length > length
      name = self.name.split
      name[0] + ' ' + name[1][0] + '.'
    else
      self.name
    end
  end

  def feed
    friend_ids = "SELECT friend_id FROM friendships
                      WHERE user_id = :user_id"
    Post.where("user_id IN (#{friend_ids})
    OR user_id = :user_id", user_id: id)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.remote_avatar = auth.info.image
    end
  end

  private 
  
  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), 
                        filename: 'default.jpg',
                        content_type: "image/jpg")
    end
  end
end
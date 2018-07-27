class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  has_one_attached :photo, dependent: :destroy

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :content, unless: -> { self.photo.attached? }
  validates :content, length: { maximum: 2000 }
  
  validates :user_id, presence: :true
end

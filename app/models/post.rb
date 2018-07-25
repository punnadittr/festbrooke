class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :likes
  has_many :comments, dependent: :destroy
  validates :content, presence: :true, length: { maximum: 2000 }
  validates :user_id, presence: :true
end

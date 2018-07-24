class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :content, presence: :true, length: { maximum: 2000 }
  validates :user_id, presence: :true
end

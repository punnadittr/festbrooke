class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: :true, length: { maximum: 2000 }
  validates :user_id, presence: :true
end

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, presence: :true
  validates :content, presence: :true, length: { maximum: 500 }
  validates :post_id, presence: :true
end

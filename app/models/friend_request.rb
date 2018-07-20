class FriendRequest < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  validates :sender, presence: true
  validates :recipient, presence: true, uniqueness: { scope: :sender }

  validate :not_friends
  validate :not_pending

  def accept
    recipient.friends << sender
    sender.friends << recipient
    destroy
  end

  private

  def not_friends
    errors.add(:recipient, 'is already added') if sender.friends.include?(recipient)
  end

  def not_pending
    if !(recipient.received_friend_requests & sender.sent_friend_requests).blank?
      errors.add(:recipient, 'already requested friendship')
    end
  end
end

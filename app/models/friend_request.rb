class FriendRequest < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  def accept
    recipient.friends << sender
    sender.friends << recipient
    destroy
  end
end

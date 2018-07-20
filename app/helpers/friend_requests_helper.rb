module FriendRequestsHelper
  def request_sent?(user)
    request = FriendRequest.where('sender_id = ? AND 
                                  recipient_id = ?', 
                                  current_user.id, 
                                  user.id)
    !request.blank?
  end

  def request_received?(user)
    request = FriendRequest.where('sender_id = ? AND 
                                  recipient_id = ?', 
                                  user.id, 
                                  current_user.id)
    !request.blank?
  end
end

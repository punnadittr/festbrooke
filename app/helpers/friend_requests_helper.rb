module FriendRequestsHelper
  def request_sent?(user)
    request = FriendRequest.find_by(recipient_id: user.id)
    current_user.sent_friend_requests.include?(request)
  end
end

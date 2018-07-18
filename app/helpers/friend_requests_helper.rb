module FriendRequestsHelper
  def accept_friend_request
    adding_user = current_user.received_friend_requests.find(params[:sender_id])
    current_user.friends.add
  end
end

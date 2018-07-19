module UsersHelper
  def adding_user
    request = current_user.received_friend_requests.find_by(sender_id: params[:sender_id])
    @adding_user = request.sender
  end
end

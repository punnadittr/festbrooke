module UsersHelper
  def adding_user
    request = current_user.received_friend_requests.find_by(sender_id: params[:sender_id])
    @adding_user = request.sender
  end

  def not_self?(other_user)
    current_user != other_user
  end
end

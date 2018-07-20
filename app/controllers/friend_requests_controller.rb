class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.sent_friend_requests.build(recipient: friend)
    if @friend_request.save
      redirect_to friend_requests_path
      flash[:success] = 'Friend request sent'
    else
      flash.now[:danger] = 'Error'
    end
  end
  
  def index
    @incoming = current_user.received_friend_requests
    @outgoing = current_user.sent_friend_requests
  end

  def destroy
    @friend_request.destroy
    redirect_to user_path(current_user.id)
    flash[:info] = 'Friend request ignored'
  end

  def update
    @friend_request.accept
    redirect_to user_path(current_user.id)
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end

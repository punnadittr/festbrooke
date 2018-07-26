class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def create
    @friend = User.find(params[:id])
    @friend_request = current_user.sent_friend_requests.build(recipient: @friend)
    if @friend_request.save
      respond_to do |format|
        format.html { redirect_to @friend }
        format.js
      end
    else
      flash[:danger] = "Something went wrong"
    end
  end
  
  def index
    @incoming = current_user.received_friend_requests
    @outgoing = current_user.sent_friend_requests
  end

  def destroy
    @friend_request.destroy
    @user = @friend_request.recipient
    respond_to do |format|
      format.html { redirect_to friend_requests_path }
      format.js
    end
  end

  def update
    @user = @friend_request.sender
    @friend_request.accept
    respond_to do |format|
      format.html { redirect_to friends_path }
      format.js
    end
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end

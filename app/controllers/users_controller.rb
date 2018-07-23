class UsersController < ApplicationController
  include UsersHelper
  include FriendRequestsHelper

  after_action :accept_mutual_friend, only: [:accept_friend]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @sent_request = current_user.sent_friend_requests.find_by(recipient_id: @user.id)
    @received_request = current_user.received_friend_requests.find_by(sender_id: @user.id)
    if current_user == @user
      @post = current_user.posts.build
      @posts = current_user.posts
    end
  end
end
class UsersController < ApplicationController
  include UsersHelper
  include FriendRequestsHelper

  after_action :accept_mutual_friend, only: [:accept_friend]

  def index
    @users = User.order(:name).page params[:page]
  end

  def show
    @user = User.find(params[:id])
    @sent_request = current_user.sent_friend_requests.find_by(recipient_id: @user.id)
    @received_request = current_user.received_friend_requests.find_by(sender_id: @user.id)
    @post = current_user.posts.build if current_user == @user
    @posts = @user.posts
  end
end
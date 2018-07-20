class FriendsController < ApplicationController
  def create
  end

  def index
    @friends = current_user.friends
  end

  def destroy
    friend = User.find(params[:id])
    current_user.friends.destroy(friend)
    friend.friends.destroy(current_user)
    redirect_to friends_path
    flash[:info] = 'Removed friend'
  end
end

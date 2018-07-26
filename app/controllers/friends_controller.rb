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
    flash.now[:info] = 'Removed friend'
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
end

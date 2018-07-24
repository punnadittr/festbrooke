class LikesController < ApplicationController
  def create
    @like = Post.find(params[:post_id]).likes.build(user: current_user)
    @like.save
  end

  def destroy
  end
end

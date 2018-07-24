class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)
    @like.save
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
end
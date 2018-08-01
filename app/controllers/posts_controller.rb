include ActionView::Helpers::UrlHelper

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = current_user.posts.build
    @feed_items = current_user.feed
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js { flash.now[:notice] = "Posted!"}
      end
    else
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js { flash.now[:alert] = "Content must not be empty"}
      end 
    end
  end

  def update

  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js { flash.now[:notice] = "Post deleted"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :photo)
    end
end

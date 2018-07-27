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
      flash[:success] = 'Posted!'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'Content must not be empty'
      redirect_to user_path(current_user)
    end
  end

  def update

  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
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

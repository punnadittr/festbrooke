class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Commented'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'Fail'
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  def update
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end

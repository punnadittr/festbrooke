class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js
      end
    else
      flash[:danger] = 'Fail'
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end

  def update
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end

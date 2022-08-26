class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    redirect_to user_posts_path(id: @comment.post_id, user_id: @comment.authorId) if @comment.save
  end
  
    private
  
  def comment_params
    params.require(:comment).permit(:Text, :authorId, :post_id)
  end
end
  
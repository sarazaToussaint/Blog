class PostsController < ApplicationController
  def index
    @user = User.find(params[ :authorId])
    @user_posts = @user.recent_post
  end

  def show
    @post = Post.find(params[:id])
  end
end

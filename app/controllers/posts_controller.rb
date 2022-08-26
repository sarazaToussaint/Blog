class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @params = params
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: @post.authorId), notice: 'Post was created successfully.'
    else
      render :new, alert: 'Error occured, Post not saved.'  
  end  

  private

  def post_params
    params.require(:post).permit( :Title, :Text, :authorId) 
  end  
end

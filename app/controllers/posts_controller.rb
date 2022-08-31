class PostsController < ApplicationController
  def index
    @user = User.find_by(params[:authorId])
    @posts = @user.posts
  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post)
        else
          flash.now[:error] = 'Error occured, Post not saved.'
          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end

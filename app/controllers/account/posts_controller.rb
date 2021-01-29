class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :destroy]
  def index
    @posts = current_user.posts
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to account_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to account_posts_path
  end

  private
  
  def find_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end

class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to account_posts_path, notice: 'Post update success'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to account_posts_path, alert: 'Post deledted'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end

class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def show

  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to :root
      flash.now[:success] = 'Post was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash.now[:success] = 'Post was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to :root
    flash.now[:danger] = 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end

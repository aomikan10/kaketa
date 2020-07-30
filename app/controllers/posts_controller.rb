class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.user = current_user
    @post.title = params[:post][:title]
    @post.copy = params[:post][:copy]
    @post.text = params[:post][:text]
    @post.save
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :copy, :text)
  end

end

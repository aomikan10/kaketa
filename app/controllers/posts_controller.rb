class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.find_by(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.user = current_user
    @post.title = params[:post][:title]
    @post.copy = params[:post][:copy]
    @post.tag_list = params[:post][:tag_list]
    @post.text = params[:post][:text]
    @post.save
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :copy, :text, :tag_list).merge(user_id: current_user.id)
  end

end

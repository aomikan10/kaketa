class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = Like.new(
      user_id: current_user.id,
      post_id: @post.id
    )
    @like.save
  end
  def destroy
    @liked = Like.find_by(
      user_id: current_user.id,
      post_id: @post.id
    )
    @liked.destroy
  end

  private
  def set_post
      @post = Post.find(params[:post_id])
  end
end

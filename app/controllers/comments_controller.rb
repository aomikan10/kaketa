class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user)
  end

  def create
    comment = Comment.create!(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

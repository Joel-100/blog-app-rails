class CommentsController < ApplicationController
  def create
    @comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, text: params[:text])
    respond_to do |_format|
      redirect_to user_post_path(current_user, @comment.post_id) if @comment.save
    end
  end
end
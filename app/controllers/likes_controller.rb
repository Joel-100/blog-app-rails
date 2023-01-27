class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    respond_to do |_format|
      redirect_to user_post_path(current_user, @like.post_id) if @like.save
    end
  end
end

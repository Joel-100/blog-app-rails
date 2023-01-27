class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.new
    # respond_to do |format|
    #   format.html { render :new, locals: { post: @post } }
    # end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    respond_to do |format|
      if @post.save
        flash[:sucess] = 'Post Saved successfully'
        format.html { redirect_to user_posts_path(current_user) }
      else
        flash.now[:error] = 'Error: Post could not be saved'
        render :new, locals: { post: @post }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

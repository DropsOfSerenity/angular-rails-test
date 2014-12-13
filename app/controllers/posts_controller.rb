class PostsController < ApplicationController

  before_filter :authenticate_user!, only: [:create]

  # GET /posts.json
  def index
    @posts = Post.all
    respond_with @posts
  end

  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  # POST /posts.json
  def create
    respond_with Post.create(post_params.merge(:user_id => current_user.id))
  end

  private
  def post_params
    params.require(:post).permit(:text, :title)
  end

end

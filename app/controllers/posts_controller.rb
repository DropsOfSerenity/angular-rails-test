class PostsController < ApplicationController

  before_filter :authenticate_user!, only: [:show, :create]

  # GET /posts.json
  def index
    respond_with Post.all
  end

  # GET /posts/1.json
  def show
    respond_with Post.find(params[:id])
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

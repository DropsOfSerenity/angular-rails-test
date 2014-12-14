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
    @post = Post.create(post_params.merge(:user_id => current_user.id))
    respond_with @post
  end

  # PUT /posts/1/vote.json
  def vote
    @post = Post.find params[:id]
    @post.increment!(:votes)

    respond_with @post
  end

  private
  def post_params
    params.require(:post).permit(:text, :title)
  end
end

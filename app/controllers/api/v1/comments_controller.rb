class Api::V1::CommentsController < ApplicationController

  # GET /posts/1/comments.json
  def index
    puts params
    @comments = Comment.where(post_id: params[:post_id])
    respond_with @comments
  end

  # GET /posts/1/comments/1.json
  def show
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  # POST /posts/1/comments.json
  def create
    @comment = Comment.create(
      comment_params.merge(user_id: current_user.id,
                           post_id: params[:post_id]))

    respond_with @comment, location: '/'
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end

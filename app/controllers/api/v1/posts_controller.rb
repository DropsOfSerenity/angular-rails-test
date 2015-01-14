class Api::V1::PostsController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create]

  # GET /api/v1/posts.json
  def index
    @posts = paginated_posts
    respond_with @posts
  end

  # GET /api/v1/posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  # POST /api/v1/posts.json
  def create
    @post = Post.create(post_params.merge(:user_id => current_user.id))
    respond_with :api, :v1, @post
  end

  # PUT /api/v1/posts/1/vote.json
  def vote
    @post = Post.find params[:id]
    @post.increment!(:votes)

    respond_with @post
  end

  private
  def post_params
    params.require(:post).permit(:text, :title)
  end

  def paginated_posts
    Post.ordered.page(page_params[:page]).per(page_params[:page_size])
  end
end

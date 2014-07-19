class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :all_categories, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.desc.paginate(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Successful'
    else
      render :new
    end
  end

  def show
    @replies = @post.replies
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Successful'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find_by(slug: params[:id])
  end

  def all_categories
    @categories_hash = Category.to_options_hash
  end

  def post_params
    params.require(:post).permit(:title, :slug, :category_id, :tag_list, :body)
  end
end

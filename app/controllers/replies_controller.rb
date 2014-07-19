class RepliesController < ApplicationController
  before_filter :require_login, only: [:edit, :update, :destroy]

  before_action :find_post

  def index
    @replies = @post.replies
  end

  def new
  end

  def create
    @reply = @post.replies.new(reply_params)

    flash[:notice] = 'Successful' if @reply.save
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_post
    @post  = Post.find_by(slug: params[:post_id])
  end

  def reply_params
    params.require(:reply).permit(:author, :email, :url, :body)
  end
end

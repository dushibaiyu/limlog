class TagsController < ApplicationController
  before_action :find_tag, only: [:show]

  def show
  end

  private

  def find_tag
    @tag   = params[:id]
    @posts = Post.has_tags(@tag).desc.paginate(params[:page])
  end
end

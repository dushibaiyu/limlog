class CategoriesController < ApplicationController
  before_action :find_category, only: [:show]

  def show
  end

  private

  def find_category
    @category = Category.find_by(slug: params[:id])
    @posts    = @category.posts.desc.paginate(params[:page])
  end
end

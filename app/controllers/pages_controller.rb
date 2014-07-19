class PagesController < ApplicationController
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

  before_action :find_page,    only: [:show, :edit, :update, :destroy]
  before_action :prepare_feed, only: [:sitemap, :rss]

  def home
    @posts = Post.desc.paginate(params[:page])
  end

  def links
    @friends = Friend.all
  end

  def sitemap
  end

  def rss
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to page_path(@page), notice: 'Successful'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to page_path(@page), notice: 'Successful'
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = 'Successful' if @page.destroy

    redirect_to root_path
  end

  private

  def find_page
    @page = Page.find_by(slug: params[:id])
  end

  def prepare_feed
    @site_url = SiteConfig.url
    @posts    = Post.desc.take(30)
  end

  def page_params
    params.require(:page).permit(:title, :slug, :body)
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_info

  private

  def get_info
    @pages = Page.all
    @categories = Category.all
  end

  def require_login
    unless already_login?
      redirect_to login_path
    end
  end

  def already_login?
    session[:login]
  end
end

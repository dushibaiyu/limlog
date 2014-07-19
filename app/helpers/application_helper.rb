module ApplicationHelper
  def current_user
    if session[:login]
      session[:user]
    else
      ''
    end
  end

  def already_login?
    session[:login]
  end
end

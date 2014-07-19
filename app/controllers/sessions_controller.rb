class SessionsController < ApplicationController
  layout 'sign'

  def new
    redirect_to root_path if already_login?
  end

  def create
    if @user = User.authenticate(session_params)
      session[:user]  = @user.account
      session[:login] = true

      redirect_to root_path, notice: 'Successful'
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user]  = nil
    session[:login] = nil

    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:account, :password)
  end
end

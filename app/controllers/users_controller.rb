class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  layout 'sign'

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user]  = @user.account
      session[:login] = true

      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def show
  end

  def edit
  end

  def update
    flash[:notice] = 'Success' if @user.update(user_params)
  end

  def destroy
    flash[:notice] = 'Success' if @user.destroy
  end

  private

  def find_user
    @user = User.find_by(account: params[:id])
  end

  def user_params
    params.require(:user).permit(:nick, :account, :email, :password, :password_confirm)
  end
end

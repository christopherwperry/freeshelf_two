class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  def index
    redirect_to '/'
  end
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

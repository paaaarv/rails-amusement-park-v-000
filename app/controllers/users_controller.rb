class UsersController < ApplicationController

  def home
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end

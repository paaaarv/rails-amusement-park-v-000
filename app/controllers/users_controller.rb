require 'pry'

class UsersController < ApplicationController
  before_action :logged_in?
  def home
  end

  def new
    @user = User.new
  end

  def create
    @current_user = User.find_by(name: params[:name])|| @user = User.new(user_params)
    if @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def signin
    @user = User.new
  end

  def login
    @current_user = User.find_by(name: params[:user][:name])
    if @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    end
  end 

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @attraction = Attraction.find(params[:user][:attraction_id])
    @user.attractions << @attraction
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    flash[:alert] = "#{@ride.take_ride}"
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end

class AttractionsController < ApplicationController
  before_action :logged_in?

   def index
     @attractions = Attraction.all
     @user = current_user
   end

   def show
     @user = current_user
     @attraction = Attraction.find(params[:id])
   end

   def new
   end

end

class AttractionsController < ApplicationController
  before_action :logged_in?

   def index
     @attractions = Attraction.all
   end

   def show
     @current_user = current_user 
     @attraction = Attraction.find(params[:id])
   end
end

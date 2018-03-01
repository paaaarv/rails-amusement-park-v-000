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
     @attraction = Attraction.new
   end

   def create
     @attraction = Attraction.new(attraction_params)

     if @attraction.save
       redirect_to attraction_path(@attraction)
     else
       redirect_to new_attraction_path
     end
   end

   private

   def attraction_params
     params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
   end
end

class LocationsController < ApplicationController
	before_action :set_location, only: [:show, :edit, :update, :destroy]

	def index
		@locations = Location.all 
	end
	
	 def show
	 end
	
	def edit
	  @location = Location.find(params[:id])
  end
	
	def new
		@location = Location.new
	end 
	
	 def create
	   @location = Location.new(location_params)

	   if @location.save
	     redirect_to locations_path
	   else
	     render :new
	   end
	 end
	
	 def update
	   @location = Location.find(params[:id])

	   if @location.update(location_params)
	     redirect_to locations_path, notice: "修改地址成功"
	   else
	     render :edit
	   end
 end

 def destroy
   @location = Location.find(params[:id])
   @location.destroy
   redirect_to locations_path, alert: "地址已刪除"
 end

	  
	 private
	
	def set_location
		@location = Location.find(params[:id])
	   end
	 
	 def location_params 
	   params.require(:location).permit(:name, :description, :code)
	 end
end

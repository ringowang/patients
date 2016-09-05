class LocationsController < ApplicationController
	before_action :set_location, only: [:show, :edit, :update, :destroy]

	def index
		@locations = Location.is_valid
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
	     redirect_to locations_path, notice: "添加地址成功"
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

 def marked_as_deleted
   @location = Location.find(params[:id])
   @location.marked_as_deleted
   redirect_to locations_path, alert: "删除成功"
 end

	  
	 private
	
	def set_location
		@location = Location.find(params[:id])
	   end
	 
	 def location_params 
	   params.require(:location).permit(:name, :description, :code)
	 end
end

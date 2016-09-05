class PatientsController < ApplicationController
	def index
	#只看的到标记为有效的（未删除的）
		@patients = Patient.is_valid
	#还得看一下和那段options_for_select一起，现在先往后做
		 @patients = @patients.where(status: params[:status]) if params[:status]	
		
	end
	
	def new
		@patient = Patient.new
	end
	
	def show
		@Patient = Patient.find(params[:id])
		@Patient.increase_view_count
	end
	
	def create
	  @patient = Patient.new(patient_params)
	
	   if @patient.save
	     redirect_to patients_path
	   else
	     render :new
	   end
	 end
	
	def view_counts
		@Patient = Patient.find(params[:id])
		@Patient.increase_view_count
		redirect_to patients_path
	end
	
	def update
		@patient = Patient.find(params[:id])
		  
		if @patient.update(patient_params)
			redirect_to patients_path
		else
		  render :edit
		end
	end

	def edit
		@patient = Patient.find(params[:id])
	end

#原本的删除
/#	
	def destroy
		@patient = Patient.find(params[:id])
		@patient.delete
		redirect_to patients_path
	end
#/

#新的删除（不是真的从数据库删除）
	def marked_as_deleted
		@patient = Patient.find(params[:id])
		@patient.marked_as_deleted
		redirect_to patients_path
	end
	
	def on_treatment
		redirect_to patients_path
	end
	

	 private
	 
	 def patient_params 
	   params.require(:patient).permit(:name, :gender, :status, :first_name, :middle_name, :last_name, :date_of_birth,:location_id)
	 end
end

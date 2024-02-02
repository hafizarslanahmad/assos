class DoctorsController < ApplicationController
    
    def new
        @doctor = Doctor.new    
    end

    def index 
        @doctors = Doctor.all
    end

    def create
        @doctor = Doctor.new(doctor_params)
        if @doctor.save 
            redirect_to root_path
        end
    end

    def edit 
        @doctor = Doctor.find(params[:id])
    end

    def update 
        @doctor = Doctor.find(params[:id])
        @doctor.update 

        redirect_to root_path
    end

    def destroy
        @doctor = Doctor.find(params[:id])
        @doctor.destroy 

        redirect_to root_path
    end

    private

    def doctor_params 
        params.require(:doctor).permit(:name, :specialization, :user_id)
    end
end
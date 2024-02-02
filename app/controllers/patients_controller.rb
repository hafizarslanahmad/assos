class PatientsController < ApplicationController

    def new
        @patient = Patient.new
    end

    def index 
        @patients = Patient.all 
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save

        redirect_to root_path
    end

    def edit 
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update

        redirect_to root_path
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy

        redirect_to root
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :diseas, :ward_name, :user_id)
    end
end
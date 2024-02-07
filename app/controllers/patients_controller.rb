class PatientsController < ApplicationController

    def new
        @patient = Patient.new
        @patient.build_doctor
    end

    def index 
        @patients = Patient.all 
    end

    def show 
        @patient = Patient.find(params[:id])
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save

         redirect_to patients_path
        end
    end

    def edit 
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])
       if @patient.update(patient_params)
        redirect_to patients_path, notice: "Patient was succesfully update"
       end
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect_to patients_path, notice: "Patient has been succesfully delete"
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :diseas, :ward_name, :doctor_id)
    end
end
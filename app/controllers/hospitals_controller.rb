class HospitalsController < ApplicationController

    def new 
        if Current.user.admin?
          @hospital=Hospital.new
        else
            redirect_to root_path, alert: "fghjk"
        end  
    end

    def index 
        @hospitals = Hospital.all
    end

    def create 
        if Current.user.admin?
            @hospital= Hospital.find(hospital_params)
            @hospital.save         
        end
        redirect_to root_path
    end

    def edit 
        @hospital = Hospital.find(params[:id])
    end

    def update
        @hospital = Hospital.find(params[:id])
        @hospital.update

        redirect_to root_path
    end

    private

    def hospital_params
        params.require(:hospital).permit(:name, :city, :user_id)
    end
end
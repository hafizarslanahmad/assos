class HospitalsController < ApplicationController

    def new 
        if Current.user.admin?
          @hospital=Hospital.new
        else
            redirect_to root_path, alert: "User Admin  could be must"
        end  
    end

    def index 
        @hospitals = Hospital.all
    end

    def show
    end

    def create 
        if Current.user.admin?
            @hospital= Hospital.new(hospital_params)
            @hospital.save         
        end
        redirect_to hospitals_path
    end

    def edit 
        @hospital = Hospital.find(params[:id])
    end

    def update
       if @hospital.update(hospital_params)
        redirect_to hospitals_path, notice: "Hospital was succesfully update"
       end
    end

    def destroy
        @hospital = Hospital.find(params[:id])
        @hospital.destroy 

        redirect_to hospitals_path, notice: "Delete succesfully"
    end

    private

    def hospital_params
        params.require(:hospital).permit(:name, :city, :user_id)
    end
end
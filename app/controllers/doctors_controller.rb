class DoctorsController < ApplicationController
    
    def new
        @doctor=Doctor.new   
        @doctor.patients.build
    end

    def index 
        @doctors = Doctor.all
    end

    def show
        @doctor = Doctor.find(params[:id])
        @patient=@doctor.patients.build
    end

    def create
        if Current.user.admin?
            @doctor = Doctor.new(doctor_params)
            pass = SecureRandom.hex 8
            @user=User.create(email: @doctor.name + '@gmail.com', password: pass, role: 'doctor', name: @doctor.name)
            puts pass
            @doctor.user_id=@user.id
            if @doctor.save

                UserMailer.welcome_email(@user, pass).deliver_now
            end
            
        end
        redirect_to doctors_path, notice: "Creat Doctor successfully"
    end

    def edit 
        @doctor = Doctor.find(params[:id])
    end

    def update
        @doctor = Doctor.find(params[:id])
       if @doctor.update(doctor_params)
        redirect_to doctors_path, notice: "Doctor was successfully update"
       end
    end

    def destroy
        @doctor = Doctor.find(params[:id])
        @doctor.destroy

        redirect_to doctors_path, notice: "Delete succesfully"
    end

    private

    def doctor_params 
        params.require(:doctor).permit(:name, :specialization, :user_id)
    end
end
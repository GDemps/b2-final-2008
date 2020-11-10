class DoctorPatientsController < ApplicationController

  def destroy
    DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:id]).delete
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

end

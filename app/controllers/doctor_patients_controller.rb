class DoctorPatientsController < ApplicationController

  def destroy
    docpat = DoctorPatient.find_by(patient_id: params[:id])
    doc = Doctor.find(docpat.doctor_id)
    doc.doctor_patients.where(patient_id: params[:id]).destroy_all
    redirect_to "/doctors/#{doc.id}"
  end

end

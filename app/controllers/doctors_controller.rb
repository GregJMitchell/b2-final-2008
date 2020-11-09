class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def remove_patient
    doctor = Doctor.find(params[:id])
    doctor_patient = doctor.find_patient_record(params[:patient_id])
    doctor_patient.destroy
    redirect_to "/doctors/#{params[:id]}"
  end
end
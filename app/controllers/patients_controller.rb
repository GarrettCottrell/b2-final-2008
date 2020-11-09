class PatientsController < ApplicationController
  def destroy
    PatientDoctor.specific_patient_doctor(params[:id], params[:doctor_id]).destroy
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
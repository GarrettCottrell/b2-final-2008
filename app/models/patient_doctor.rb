class PatientDoctor < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  def self.specific_patient_doctor(patient_id_variable, doctor_id_variable)
    self.where('patient_id =?', patient_id_variable).where('doctor_id =?', doctor_id_variable)[0]
  end
end
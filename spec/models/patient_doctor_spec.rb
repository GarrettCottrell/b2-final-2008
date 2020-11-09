require 'rails_helper'

RSpec.describe PatientDoctor, type: :model do
  describe 'relationships' do
    it {should belong_to :patient}
    it {should belong_to :doctor}
  end
describe "instance methods" do
  it "#specific_doctor" do

      happy_hospital = Hospital.create!(name: 'Happy Hospital')
      sarah = happy_hospital.doctors.create!(name: 'Sarah', specialty: "Brain Surgery", university: 'Harvard')
      joe = happy_hospital.doctors.create!(name: 'Joe', specialty: "Foot Surgeon", university: 'Florida State')
      sally = happy_hospital.doctors.create!(name: 'Sally', specialty: "Plastic Surgery", university: 'Columbia')
      fred = happy_hospital.doctors.create!(name: 'Fred', specialty: "Hand Surgery", university: 'Harvard')
      bob = happy_hospital.doctors.create!(name: 'Bob', specialty: "Leg Surgery", university: 'Columbia')

      alfred_patient = Patient.create!(name: "alfred_patient", age: 14)
      suzie_patient = Patient.create!(name: "suzie_patient", age: 14)
      joe_patient = Patient.create!(name: "joe_patient", age: 14)

      alfred_patient_doctor_1 = PatientDoctor.create!(patient_id: alfred_patient.id, doctor_id: sarah.id)
      suzie_patient_doctor_1 = PatientDoctor.create!(patient_id: suzie_patient.id, doctor_id: sarah.id)
      joe_patient_doctor_1 = PatientDoctor.create!(patient_id: joe_patient.id, doctor_id: sarah.id)
      alfred_patient_doctor_2 = PatientDoctor.create!(patient_id: alfred_patient.id, doctor_id: joe.id)
      alfred_patient_doctor_3 = PatientDoctor.create!(patient_id: alfred_patient.id, doctor_id: fred.id)
      expect(PatientDoctor.specific_patient_doctor(alfred_patient.id, sarah.id)).to eq(alfred_patient_doctor_1)
    end
  end
end
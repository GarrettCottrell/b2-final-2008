require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    it "#doctor_count" do

      happy_hospital = Hospital.create!(name: 'Happy Hospital')
      sarah = happy_hospital.doctors.create!(name: 'Sarah', specialty: "Brain Surgery", university: 'Harvard')
      joe = happy_hospital.doctors.create!(name: 'Joe', specialty: "Foot Surgeon", university: 'Florida State')
      sally = happy_hospital.doctors.create!(name: 'Sally', specialty: "Plastic Surgery", university: 'Columbia')
      fred = happy_hospital.doctors.create!(name: 'Fred', specialty: "Hand Surgery", university: 'Harvard')
      bob = happy_hospital.doctors.create!(name: 'Bob', specialty: "Leg Surgery", university: 'Columbia')

      alfred = sarah.patients.create!(name: "Alfred", age: 21)
      suzie = sarah.patients.create!(name: "Suzie", age: 30)
      joe = sarah.patients.create!(name: "Joe", age: 60)

      expect(happy_hospital.doctor_count).to eq(5)
    end
    it "#unique_universities" do

      happy_hospital = Hospital.create!(name: 'Happy Hospital')
      sarah = happy_hospital.doctors.create!(name: 'Sarah', specialty: "Brain Surgery", university: 'Harvard')
      joe = happy_hospital.doctors.create!(name: 'Joe', specialty: "Foot Surgeon", university: 'Florida State')
      sally = happy_hospital.doctors.create!(name: 'Sally', specialty: "Plastic Surgery", university: 'Columbia')
      fred = happy_hospital.doctors.create!(name: 'Fred', specialty: "Hand Surgery", university: 'Harvard')
      bob = happy_hospital.doctors.create!(name: 'Bob', specialty: "Leg Surgery", university: 'Columbia')

      alfred = sarah.patients.create!(name: "Alfred", age: 21)
      suzie = sarah.patients.create!(name: "Suzie", age: 30)
      joe = sarah.patients.create!(name: "Joe", age: 60)

      expect(happy_hospital.unique_universities).to eq(["Columbia", "Florida State", "Harvard"])
    end
  end
end
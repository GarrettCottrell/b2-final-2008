require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a hospitals show page /hospitals/:id' do
    it 'I see the hospitals name and I see the number of doctors that work at 
    this hospital and I see a unique list of universities that this hospitals 
    doctors attended' do
      happy_hospital = Hospital.create!(name: 'Happy Hospital')
      sarah = happy_hospital.doctors.create!(name: 'Sarah', specialty: "Brain Surgery", university: 'Harvard')
      joe = happy_hospital.doctors.create!(name: 'Joe', specialty: "Foot Surgeon", university: 'Florida State')
      sally = happy_hospital.doctors.create!(name: 'Sally', specialty: "Plastic Surgery", university: 'Columbia')
      fred = happy_hospital.doctors.create!(name: 'Fred', specialty: "Hand Surgery", university: 'Harvard')
      bob = happy_hospital.doctors.create!(name: 'Bob', specialty: "Leg Surgery", university: 'Columbia')

      alfred = sarah.patients.create!(name: "Alfred", age: 21)
      suzie = sarah.patients.create!(name: "Suzie", age: 30)
      joe = sarah.patients.create!(name: "Joe", age: 60)

      visit "/hospitals/#{happy_hospital.id}"

      expect(page).to have_content("#{happy_hospital.name}")
      expect(page).to have_content(5)
      expect(page).to have_content("Harvard")
      expect(page).to have_content("Florida State")
      expect(page).to have_content("Columbia")
    end
  end
end
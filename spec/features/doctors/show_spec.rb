require 'rails_helper'
describe 'As a visitor' do
  describe 'When I visit a doctors show page /doctors/:id' do
    it 'I see all of that doctors information including name/speciality
    university attended and I see the name of the hospital where they work
    and I see name of all patients this doctor has' do
      happy_hospital = Hospital.create!(
        name: 'Happy Hospital'
      )
        sarah = happy_hospital.doctors.create!(
        name: 'Sarah',
        specialty: "Brain Surgery",
        university: 'Harvard'
      )

      alfred = sarah.patients.create!(name: "Alfred", age: 21)
      suzie = sarah.patients.create!(name: "Suzie", age: 30)
      joe = sarah.patients.create!(name: "Joe", age: 60)

      visit "/doctors/#{sarah.id}"
      expect(page).to have_content("#{sarah.name}")
      expect(page).to have_content("#{sarah.specialty}")
      expect(page).to have_content("#{sarah.university}")
      expect(page).to have_content("#{sarah.hospital.name}")
      expect(page).to have_content("Alfred")
      expect(page).to have_content("Suzie")
      expect(page).to have_content("Joe")
    end
  end
end
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
      expect(page).to have_content("#{alfred.name}")
      expect(page).to have_content("#{suzie.name}")
      expect(page).to have_content("#{joe.name}")
    end

    it 'Next to each patients name, I see a button to remove that patient
    from that doctors caseload. When I click that button for one patient,
    Im brought back ot the Doctors show page and I no longer see that
    patients name listed' do
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
      expect(page).to have_content("#{alfred.name}")
      expect(page).to have_content("#{suzie.name}")
      expect(page).to have_content("#{joe.name}")
      expect(page).to have_button("Remove #{alfred.name} from caseload")
      expect(page).to have_button("Remove #{suzie.name} from caseload")
      expect(page).to have_button("Remove #{joe.name} from caseload")
      click_button("Remove #{alfred.name} from caseload")
      expect(current_path).to eq("/doctors/#{sarah.id}")
      expect(page).to_not have_button("Remove #{alfred.name} from caseload")
      expect(page).to_not have_content("#{alfred.name}")
      click_button("Remove #{suzie.name} from caseload")
      expect(current_path).to eq("/doctors/#{sarah.id}")
      expect(page).to_not have_button("Remove #{suzie.name} from caseload")
      expect(page).to_not have_content("#{suzie.name}")
      click_button("Remove #{joe.name} from caseload")
      expect(current_path).to eq("/doctors/#{sarah.id}")
      expect(page).to_not have_button("Remove #{joe.name} from caseload")
      expect(page).to_not have_content("#{joe.name}")
    end
  end
end
# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a hospital's show page" do
    describe "I see the hospital's name" do
      it "And I see the number of doctors that work at this hospital And I see a unique list of universities that this hospital's doctors attended" do
        hospital = Hospital.create!(name: 'Mercy')

        doctor = Doctor.create(name: 'Dr. Mike', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)
        doctor2 = Doctor.create(name: 'Dr. Kat', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)
        doctor3 = Doctor.create(name: 'Dr. Meg', specialty: 'I.D.', university: 'Harvard', hospital_id: hospital.id)
        doctor4 = Doctor.create(name: 'Dr. Brian', specialty: 'I.D.', university: 'NYU', hospital_id: hospital.id)

        visit "/hospitals/#{hospital.id}"

        expect(page).to have_content(hospital.name)
        expect(page).to have_content(4.to_s)
        expect(page).to have_content('Hopkins')
        expect(page).to have_content('Harvard')
        expect(page).to have_content('NYU')
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a doctor's show page" do
    describe "I see all of that doctor's name specialty university where they got their doctor at" do
      it 'And I see the name of the hospital where this doctor work And I see the names of all of the patients this doctor has' do
        patient = Patient.create(name: 'Greg', age: 21)
        patient2 = Patient.create(name: 'Not Greg', age: 21)
        hospital = Hospital.create!(name: 'Mercy')

        
        doctor = Doctor.create(name: 'Dr. Mike', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)

        DoctorPatient.create(doctor_id: doctor.id, patient_id: patient.id)
        DoctorPatient.create(doctor_id: doctor.id, patient_id: patient2.id)

        visit "/doctors/#{doctor.id}"

        expect(page).to have_content(doctor.name)
        expect(page).to have_content(doctor.specialty)
        expect(page).to have_content(doctor.university)
        expect(page).to have_content(hospital.name)
        expect(page).to have_content(patient.name)
        expect(page).to have_content(patient2.name)
      end
    end
  end
end

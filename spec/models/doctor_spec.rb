# frozen_string_literal: true

require 'rails_helper'

describe Doctor, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    it 'find_patient_records()' do
      patient = Patient.create(name: 'Greg', age: 21)
      patient2 = Patient.create(name: 'Not Greg', age: 21)
      hospital = Hospital.create!(name: 'Mercy')

      doctor = Doctor.create(name: 'Dr. Mike', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)

      doc_patient1 = DoctorPatient.create(doctor_id: doctor.id, patient_id: patient.id)
      doc_patient2 = DoctorPatient.create(doctor_id: doctor.id, patient_id: patient2.id)

      expect(doctor.find_patient_record(patient.id)).to eq(doc_patient1)
    end
  end
end

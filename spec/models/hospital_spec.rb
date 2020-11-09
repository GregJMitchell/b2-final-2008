# frozen_string_literal: true

require 'rails_helper'

describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'instance methods' do
    it 'doctors_count' do
      hospital = Hospital.create!(name: 'Mercy')

      doctor = Doctor.create(name: 'Dr. Mike', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)
      doctor2 = Doctor.create(name: 'Dr. Kat', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)
      doctor3 = Doctor.create(name: 'Dr. Meg', specialty: 'I.D.', university: 'Harvard', hospital_id: hospital.id)
      doctor4 = Doctor.create(name: 'Dr. Brian', specialty: 'I.D.', university: 'NYU', hospital_id: hospital.id)

      expect(hospital.doctors_count).to eq(4)
    end

    it 'doctors_universities' do
      hospital = Hospital.create!(name: 'Mercy')

      doctor = Doctor.create(name: 'Dr. Mike', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)
      doctor2 = Doctor.create(name: 'Dr. Kat', specialty: 'I.D.', university: 'Hopkins', hospital_id: hospital.id)
      doctor3 = Doctor.create(name: 'Dr. Meg', specialty: 'I.D.', university: 'Harvard', hospital_id: hospital.id)
      doctor4 = Doctor.create(name: 'Dr. Brian', specialty: 'I.D.', university: 'NYU', hospital_id: hospital.id)

      expect(hospital.doctors_universities).to eq(%w[Harvard Hopkins NYU])
    end
  end
end

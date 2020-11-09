# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the patients index page' do
    it 'I see the names of all the patients listed from oldest to youngest' do
      patient = Patient.create(name: 'Greg', age: 24)
      patient2 = Patient.create(name: 'Not Greg', age: 23)
      patient3 = Patient.create(name: 'A Greg_3', age: 21)

      visit "/patients"
      patient.name.should appear_before("A Greg_3")
      
      expect(page).to have_content(patient.name)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient3.name)
    end
  end
end

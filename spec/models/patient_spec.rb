require "rails_helper"

describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients}
    it { should have_many(:doctors).through(:doctor_patients) } 
  end

  describe "class methods" do
    it "order_by_age" do
      patient = Patient.create(name: 'Greg', age: 24)
      patient2 = Patient.create(name: 'Not Greg', age: 23)
      patient3 = Patient.create(name: 'A Greg_3', age: 21)

      expect(Patient.order_by_age.first).to eq(patient)
      expect(Patient.order_by_age.last).to eq(patient3)
    end
    
    
  end
  
end
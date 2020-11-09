require "rails_helper"

describe Doctor, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients}
    it { should have_many(:patients).through(:doctor_patients) } 
  end
end
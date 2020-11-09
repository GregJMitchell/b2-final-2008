class Doctor < ApplicationRecord
  belongs_to :hospital, class_name: "hospital", foreign_key: "hospital_id"

  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
end
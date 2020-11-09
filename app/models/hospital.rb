class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_count
    doctors.count(:id)
  end

  def doctors_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end
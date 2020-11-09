class Hospital < ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def universities
    doctors.distinct.pluck(:university)
  end
end

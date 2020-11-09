class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    #not sure if the (:all) is better or worse to include but put it in just in case
    #otherwise I would just do doctors.count
    doctors.count(:all)
  end

  def unique_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end

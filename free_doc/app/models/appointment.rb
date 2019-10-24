class Appointment < ApplicationRecord
	belongs_to :doctor
  	belongs_to :patient
  	belongs_to :city, optional: true # comme ca l'appoin. peut etre creer sans city
end

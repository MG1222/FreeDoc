class Doctor < ApplicationRecord
	has_many :appointments
    has_many :patients, through: :appointments
    belongs_to :city, optional: true # doctor peut etre creer sans city
    has_many :join_table_specialty_doctors
    has_many :specialty, through: :join_table_specialty_doctors
end

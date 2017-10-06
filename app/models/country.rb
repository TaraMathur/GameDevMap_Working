class Country < ApplicationRecord
	has_many :state_provs
	has_many :cities
	has_many :companies
end

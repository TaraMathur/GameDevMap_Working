class StateProv < ApplicationRecord
	belongs_to :country
	has_many :cities
#	has_many :companies, through :cities

def get_country
	return Country.find(self.country_id)
end

def get_country_name
	country = get_coutry
	return country.name
end

end

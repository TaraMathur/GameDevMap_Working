class Company < ApplicationRecord	
	validates :name, presence: true
	validates :url, presence: true

#	belongs_to :listing_status
	belongs_to :category
	belongs_to :city

def get_city
	return City.find(self.city_id)
end

def get_city_name
	city = get_city()
	return city.name
end

def get_stateprov
	city = get_city
	return city.state_prov
end

def get_stateprov_name
	stateprov = get_stateprov
	return stateprov.name
end

def get_country
	stateprov = get_stateprov
	return stateprov.get_country
end

def get_country_name
	country = get_country
	return country.name
end

def self.search(search)

	# Search by Company Name
 	byCompanyName = where("name LIKE ?", "%#{search}%")

 	# Search by City
	byCityName = joins(:city).where("cities.name LIKE ?", "%#{search}%")
	result = byCompanyName + byCityName

	# Search by StateProv
	cities = 	City.joins(:state_prov).where("state_provs.name LIKE ?", "%#{search}%").pluck(:id)
	comps = where(city_id: cities)
	if comps
		result = result + comps
	end

	# Search by Country
	states = 	StateProv.joins(:country).where("countries.name LIKE ?", "%#{search}%").pluck(:id)
	cities = City.where(state_prov_id: states).pluck(:id)
	comps = where(city_id: cities)
	if comps
		result = result + comps
	end

   	return result

 end

 def self.mappoint_search(search)
 	mappoints = MapPoint.where("name LIKE ?", "%#{search}%").pluck(:id)
 	cities = City.where(map_point_id: mappoints)
 	city_ids = cities.pluck(:id)
 	comps = where(city_id: city_ids)

 	return comps
 end

 def self.comptype_search(search)
 	comptype_ids = Category.where(id: search)
 	comps = where(category_id: comptype_ids)

 	return comps
 end

 def self.find_comps_in_country(country_id)
	# Search by Country
	states = StateProv.joins(:country).where(country_id: country_id)
	cities = City.where(state_prov_id: states).pluck(:id)
	comps = where(city_id: cities)

	return comps
 	end

 def self.find_comps_in_city(city_id)
	comps = where(city_id: city_id)
	return comps
 	end

 def self.find_stateprovs(country_id)
 	states = StateProv.where(country_id: country_id)
 	return states
 	end
end
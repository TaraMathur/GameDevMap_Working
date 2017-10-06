class MapPoint < ApplicationRecord
	has_many :cities
	has_one :state_prov, through: :cities
	has_one :country, through: :state_prov
	has_many :companies, through: :cities
end

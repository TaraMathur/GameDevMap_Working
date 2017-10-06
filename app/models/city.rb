class City < ApplicationRecord
	has_many :companies

	belongs_to :state_prov
	belongs_to :region
	belongs_to :map_point
	
#	has_one :countr, through :state_prov

	def get_stateprov
	return StateProv.find(self.state_prov_id)
	end

	def get_stateprov_name
	stateprov = get_stateprov
	return stateprov.name
end

end

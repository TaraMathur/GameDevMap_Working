class City < ApplicationRecord
  has_many :companies
  belongs_to :state_prov
  belongs_to :region
  belongs_to :map_point 
end

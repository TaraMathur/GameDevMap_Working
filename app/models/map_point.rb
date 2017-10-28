class MapPoint < ApplicationRecord
  has_many :cities
  has_one :state_prov, through: :cities
  has_one :country, through: :state_prov
  has_many :companies, through: :cities

  def self.find_populated_mappoints

    # To do: Find all map points that contain companies
    joins(:city).where("cities.name LIKE ?", "%#{search}%")
    
    cities = City.where()
    mappoints = MapPoint.where("name LIKE ?", "%#{search_value}%").pluck(:id)
    return mappoints
  end
end

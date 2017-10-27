class Company < ApplicationRecord 
  # To do: validate for uniqueness
  validates :name, presence: true
  validates :url, presence: true
  validates :city_id, presence: true
  validates :category_id, presence: true
  validates :listing_status, presence: true

  belongs_to :category
  belongs_to :city

  def self.column_search(search)

    byCompanyName = where("name LIKE ?", "%#{search}%")

    byCityName = joins(:city).where("cities.name LIKE ?", "%#{search}%")

    cities = City.joins(:state_prov).where("state_provs.name LIKE ?", "%#{search}%").pluck(:id)
    byStateProvName = where(city_id: cities)
    
    states =  StateProv.joins(:country).where("countries.name LIKE ?", "%#{search}%").pluck(:id)
    cities = City.where(state_prov_id: states).pluck(:id)
    byCountryName = where(city_id: cities)
    
    result = byCompanyName + byCityName + byStateProvName + byCountryName

      return result.uniq

   end

   def self.filter_search(params)

    if (params["clickedMapPoint"])
      search_value = params["clickedMapPoint"]
      mappoints = MapPoint.where("name LIKE ?", "%#{search_value}%").pluck(:id)
      cities = City.where(map_point_id: mappoints)
      city_ids = cities.pluck(:id)
      comps = where(city_id: city_ids)
      return comps

    elsif (params["categorySelected"] && params["categorySelected"]!= "")
      search_value = params["categorySelected"]
      comptype_ids = Category.where(id: search_value)
      comps = where(category_id: comptype_ids)
      return comps

    elsif (params["countrySelected"] && params["countrySelected"]!= "")
      search_value = params["countrySelected"]
      states = StateProv.joins(:country).where(country_id: search_value)
      cities = City.where(state_prov_id: states).pluck(:id)
      comps = where(city_id: cities)
      return comps
    end

   end

end
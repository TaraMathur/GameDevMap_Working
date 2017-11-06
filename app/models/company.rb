class Company < ApplicationRecord 
  validates :name, presence: true
  validates :url, presence: true
  validates :city_id, presence: true
  validates :category_id, presence: true
  validates_uniqueness_of :name, scopes: [:city]

  belongs_to :category
  belongs_to :city
  belongs_to :listing_status

  before_save :set_defaults, unless: :persisted?

  def set_defaults
    if !self.listing_status_id
      self.listing_status_id = ListingStatus.find_by(status: "Submitted").id
    end
  end

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

    # To-do: Check which filters are already set

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
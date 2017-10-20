class CompaniesController < ApplicationController
	before_action :set_company, only: [:show, :edit, :update, :destroy]

	def index
		@mappoints = MapPoint.all
		@latLong = {}
		@mapDatum = []
		i = 0

		# Needed for amMap ----------
		@mappoints.each do |element|
			@latLong[element.name] = {"latitude": element.latitude, "longitude": element.longitude}
			@mapDatum[i] = {"code": element.name , "name": element.name, "value":32358260, "color":"#e74c3c"}
			i = i + 1
		end
		# ----

		# Search bar search
		if (params[:search] && params[:commit]!="clear")
			@companies = Company.search(params[:search])
			#.order("created_at DESC")
		# Map Click
		elsif (params["clickedMapPoint"])
			@companies = Company.search(params["clickedMapPoint"])
		else
			@companies = Company.all
		end

		# This isn't working yet
		if (params[:category_id] && params[:commit]!="")
			@companies = Company.all
			#where(:category_id @companies.category_id)
		end

		@cities = City.all
	end

	def new
    @company = Company.new
  	end

  	def create
  		byebug
    	@company = Company.new(company_params)
      if @company.save
        redirect_to @company, notice: 'Company was successfully created.'
      else
        render :new
      end

  end

  def show
	@company = Company.find(params[:id])
end

def filter_on_map

	# Searching via Map
	if (params["clickedMapPoint"])
		@companies = Company.mappoint_search(params["clickedMapPoint"])
	else
		@companies = Company.all
	end
end

def filter_on_selects
	if (params["comp_type"])
		@companies = Company.comptype_search(params["comp_type"])
	else
		@companies = Company.all
	end

end

 def filter_on_country_select
 	# check if city or state is selected, if yes then call another find method
 	if (params["countrySelected"] && params["countrySelected"]!= "")
 		@companies = Company.find_comps_in_country(params["countrySelected"])
 	else
 		@companies = Company.all
 	end

# 		@stateprovs = Company.find_stateprovs(params["countrySelected"])
 end

 def filter_on_city_select
 	# check if city or state is selected, if yes then call another find method
 	if (params["citySelected"] && params["citySelected"]!= "")
 		@companies = Company.find_comps_in_city(params["citySelected"])
 	else
 		@companies = Company.all
 	end

# 		@stateprovs = Company.find_stateprovs(params["countrySelected"])
 end

  private

def set_company
	@company = Company.find(params[:id])
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :url, :city_id, :category_id, :listing_status)
    end

    def sortable_columns
    	["name"]
    end

    def sort_column
    	sortable_columns.include?(params[:column]) ? params[:column] : "name"
  	end

  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end

end

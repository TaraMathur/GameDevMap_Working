class CompaniesController < ApplicationController
	before_action :set_company, only: [:edit, :update, :destroy]

	def index

		if (params[:search] && params[:commit]!="clear")
			@companies = Company.column_search(params[:search])
		else
			@companies = Company.all
		end

		# Needed for creating map points for amMap ---
		@mappoints = MapPoint.all
		@latLong = {}
		@mapDatum = []
		i = 0

		@mappoints.each do |element|
			@latLong[element.name] = {"latitude": element.latitude, "longitude": element.longitude}
			@mapDatum[i] = {"code": element.name , "name": element.name, "value":32358260, "color":"#e74c3c"}
			i = i + 1
		end
		# ---
	end

	def filter
		# To do: enable filters to work together
		@companies = Company.filter_search(params)
	end

	def new
	    @company = Company.new
  	end

  	def create
    	@company = Company.new(company_params)
      	
      	if @company.save
        	redirect_to @company, notice: 'Company was successfully created.'
    	else
        	render :new
    	end
  	end

  private

	def set_company
		@company = Company.find(params[:id])
	end

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

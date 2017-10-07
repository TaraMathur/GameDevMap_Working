class CompaniesController < ApplicationController

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

		if (params[:search] && params[:commit]!="clear")
			@companies = Company.search(params[:search])
			#.order("created_at DESC")
		else
			@companies = Company.all
		end

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

 def update_stateprovs
 	byebug
 	@stateprovs = StateProv.where("country.name LIKE ?", "Argentina")
 end
end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :url, :city_id, :category_id, :listing_status)
    end


class CompaniesController < ApplicationController
  def index

    if (params[:search] && params[:commit]!="clear")
      @companies = Company.column_search(params[:search])
    else
      @companies = Company.all
    end

    # Needed for creating map points for amMap ---
    @mapPoints = MapPoint.all  # To do: change this to only include map points that have companies
    @latLongs = {}
    @mapData = []
    i = 0

    @mapPoints.each do |element|
      @latLongs[element.name] = {"latitude": element.latitude, "longitude": element.longitude}
      @mapData[i] = {"code": element.name , "name": element.name, "value":32358260, "color":"#e74c3c"}
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

  def company_params
    params.require(:company).permit(:name, :url, :city_id, :category_id, :listing_status)
  end

end

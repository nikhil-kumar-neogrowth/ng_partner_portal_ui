class PortfolioController < ApplicationController
  
  require 'pp'
  include PortfolioHelper
  
  def report1
  	if(params.has_key?(:date) && params.has_key?(:filter))
  		date = params[:date]
  		@date = date
      filter = params[:filter]
      @filter = filter
  		date= date.to_time.strftime('%d-%m-%Y')
  		
  	else
      @date = '2015-10-05'
      filter = "Name"
  		@resources = []#JSON.parse(resource.body)
  	end
  	url =  "/get_overall_Disbursement?FieldName=#{filter}&DateValue=#{date}"
    @resources = getResponse(url)
  	@select_values = {"Name":"Industry Name", "CityName":"City"}
    @col1 = "Principal Balance"
    @col2 = "Minimum Balance"
    @col3 = "Loan Balance"
  	
  	
  end

  def report2
  end

  def report3
    url = "/get_partners_details_complete"
    @resources = getResponse(url)

  end

  def getResponse(url)
    base_uri = "http://localhost:3000"
    url = base_uri + url
  	resource = HTTParty.get(url)
  	resources = JSON.parse(resource.body)
  	if resources.length > 0
  		return resources
  	else 
  		return []
  	end
  end


end

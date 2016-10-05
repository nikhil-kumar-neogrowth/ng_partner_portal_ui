class ApplicationsController < ApplicationController
  def details
  	appid= params[:ApplicationID]
  	@appid = appid
  	base_uri = "http://localhost:3000"

  	# @basic_details = []
  	# @deal_terms	= []
  	# @funding_details = []
  	# @repayment_details = []

  
  	url =  "#{base_uri}/get_application_basic_details?ApplicationID=#{appid}"
  	@basic_details = getResponse(url)

  	url = "#{base_uri}/get_application_deal_details?ApplicationID=#{appid}"
  	@deal_terms = getResponse(url)

  	url = "#{base_uri}/get_application_funding_details?ApplicationID=#{appid}"
  	@funding_details = getResponse(url)

  	url = "#{base_uri}/get_application_repaymec_details?ApplicationID=#{appid}"
  	@repayment_details = getResponse(url)

  	url = "#{base_uri}/get_application_documents_details?ApplicationID=#{appid}"
  	docs_json = getResponse2(url)
  	@document_details = docs_json.group_by {|d| d["FolderName"]}
  	# @document_details.each do |k,v|
  	# 	puts k
  	# 	puts v
  	# end
  	# p "\n"
  	# render :nothing => true
  	# render :json => @document_details
  end

  def getResponse(url)
  	resource = HTTParty.get(url)
  	resources = JSON.parse(resource.body)
  	if resources.length > 0
  		return resources[0]
  	else 
  		return []
  	end
  end

  def getResponse2(url)
  	resource = HTTParty.get(url)
  	resources = JSON.parse(resource.body)
  	if resources.length > 0
  		return resources
  	else 
  		return []
  	end
  end
  def all
  	base_uri = "http://localhost:3000"
  
  	url =  "#{base_uri}/get_partners_application_details"
  	resource = HTTParty.get(url)
  	# resource = HTTParty.get(@base_uri+"/get_partners_application_details")
  	@resources = JSON.parse(resource.body)
  	# render :json => @resources
  end

  def applicationdetails
  	base_uri = "http://localhost:3000"
  
  	url =  "#{base_uri}/get_partners_application_details"
  	resource = HTTParty.get(url)
  	# resource = HTTParty.get(@base_uri+"/get_partners_application_details")
  	@resources = JSON.parse(resource.body)
  	# render :json => @resources
  end

end

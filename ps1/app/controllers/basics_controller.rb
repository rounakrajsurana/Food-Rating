
class BasicsController < ApplicationController
	before_action :set_quotations,    only: [:quotations]


	def quotations

		@categories = Quotation.distinct.pluck(:category)
		if params[:quotation]
			if params[:ncategory]
				params[:catagory] = params[:ncategory]
			end
				@quotation = Quotation.new( params.require(:quotation).permit(:author_name, :category, :quote) )
			
			if @quotation.save
				flash[:notice] = 'Quotation was successfully created.'
				@quotation = Quotation.new
				redirect_to basics_quotations_path			
			end
		else
			@quotation = Quotation.new	
		end
#SORT BY DATE AND CATEGORY 
		if params[:sort_by] == "date"
			if params[:keyword]
				@quotations = Quotation.where("lower(quote) LIKE :search OR lower(author_name) LIKE :search", search: "%#{params[:keyword]}%").all.order(:created_at)
			# elsif params[:keyword]
			# 	@quotations = Quotation.where("lower(author_name) LIKE ?", "%#{params[:keyword]}%").all.order(:created_at)
			# else
				@quotations = Quotation.where.not(id: get_killed).order(:created_at)
			end

				logger = Logger.new STDOUT
				logger.info @quotations

		else
# SEARCH CONDITION
			if params[:keyword]
					@quotations = Quotation.where("lower(quote) LIKE :search or lower(author_name) LIKE :search", search: "%#{params[:keyword]}%").all.order(:category)
				# elsif params[:keyword]
				# 	@quotations = Quotation.where("lower(author_name) LIKE ?", "%#{params[:keyword]}%").all.order(:category)
			else
				@quotations = Quotation.where.not(id: get_killed).order(:category)
			end
		end
	end


	require 'open-uri'
	require 'nokogiri'
# KILLING COOKIES
	def killed

		if params[:del] == 'yes'
			
				cookies.delete(:kid)
				
		end

		logger = Logger.new STDOUT
		logger.info "fasdfsdasdsdfsdafasdfsdafsd"

		@kill_array = []
		if cookies[:kid]
			@kill_array = cookies[:kid].split(",")
		end

		@kill_array.push params[:newvar].to_i

		cookies[:kid] = { value: @kill_array.join(","), expires: 1.day }


		logger = Logger.new STDOUT
		logger.info "asdfasdFadsFADSFasdfasdfasdfasdf"
		logger.info cookies

		flash[:notice] = 'kill was successful.'
		redirect_to basics_quotations_path
	
	end

	def set_quotations
      # setting quotations and quotation vars
	    killed_ids = [] 
	    if cookies[:kid]
		    killed_ids = cookies[:kid].split(',')
		end
		killed_ids = killed_ids.map do |x|
			x.to_i
		end

      	if killed_ids.blank?
        	@quotations = Quotation.all
      	else
	        @quotations = Quotation.where.not(id: killed_ids)
      	end
    end

    def get_killed
			killed_ids = [] 
	    if cookies[:kid]
		    killed_ids = cookies[:kid].split(',')
		end
		killed_ids = killed_ids.map do |x|
			x.to_i
		end

		logger = Logger.new STDOUT
		logger.info killed_ids

		return killed_ids
    end	


	# def search
	#     #searching keyword both in quote and author_name
	#   @keyword = params[:keyword]

	#   @results_from_quote = Quotation.where('lower(quote) LIKE ? AND id NOT IN (?)', "%#{@keyword}%").all
	#   @results_from_author_name = Quotation.where('lower(author_name) LIKE ? AND id NOT IN (?)', "%#{@keyword}%").all
	# end
	
	def export_xml

		@quo = Quotation.all
	  	send_data @quo.as_json.to_xml.to_s
	    # redirect_to basics_path 		
    end

    def export_json

		@quo = Quotation.all
	  	send_data @quo.to_json
	    
	end	
	
	def import_quotations
    	if params[:upload]
    		urll = params[:upload]
    		
    	end

    		xml = params[:upload].read # if your xml is in the 'data.xml' file
			xml_hash = Hash.from_xml(xml)['objects']
			logger = Logger.new STDOUT
			logger.info xml_hash


			xml_hash.each do |x|
				quotation = Quotation.new
				quotation.author_name = x["author_name"]
				quotation.category = x["category"]
				quotation.quote = x["quote"]
				quotation.created_at = x["created_at"]
				quotation.updated_at = x["updated_at"]
			quotation.save
			end
   		
    	redirect_to basics_quotations_path
  	end




end








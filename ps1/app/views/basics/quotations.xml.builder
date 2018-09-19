xml.instruct!
xml.quotations do
	  @quotations.each do |quo|
   	xml.quo do
      xml.author_name quo.author_name
      xml.category quo.category
      xml.quote quo.quote
      xml.created_at quo.created_at
      xml.updated_at quo.updated_at
   	end
	end 
end
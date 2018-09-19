json.quotations @quotations do |quotation|
  json.id quotation.id
  json.author_name quotation.author_name
  json.category quotation.category
  json.quote quotation.quote
end
json.extract! log_rating, :id, :rating_id, :rate, :comment, :dish_id, :user_id, :created_at, :updated_at
json.url log_rating_url(log_rating, format: :json)

json.extract! dish, :id, :name, :desc, :picture, :category_id, :stall_id, :user_id, :created_at, :updated_at
json.url dish_url(dish, format: :json)

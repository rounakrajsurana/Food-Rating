class Dish < ApplicationRecord
  belongs_to :category
  belongs_to :stall
  belongs_to :user
end

class Rating < ApplicationRecord
  belongs_to :dish
  belongs_to :user
  has_many :log_ratings, dependent: :destroy
end

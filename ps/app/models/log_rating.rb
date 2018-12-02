class LogRating < ApplicationRecord  
  belongs_to :rating
  belongs_to :dish
  belongs_to :user
end

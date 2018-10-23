class Category < ApplicationRecord
  belongs_to :user
  #before_validation :assign_user

  # def assign_user
  #   self.user_id = current_user.id if self.user_id.nil?
  # end
end

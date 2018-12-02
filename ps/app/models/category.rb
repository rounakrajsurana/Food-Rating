class Category < ApplicationRecord
  belongs_to :user
  has_many :dish, dependent: :destroy
  #before_validation :assign_user
  validates_presence_of :name
  validates_uniqueness_of :name

  # def assign_user
  #   self.user_id = current_user.id if self.user_id.nil?
  # end
end

class Dish < ApplicationRecord
  belongs_to :category
  belongs_to :stall
  belongs_to :user
  has_many :ratings, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :desc
  validates_presence_of :picture
  validates_presence_of :category_id
  validates_presence_of :stall_id
  has_one_attached :picture
end

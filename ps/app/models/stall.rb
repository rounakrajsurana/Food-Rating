class Stall < ApplicationRecord
  belongs_to :user
  # belongs_to :owner
  has_many :dishes, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
  # validates_presence_of :latlog
  validates_presence_of :owner

  has_one_attached :picture
end

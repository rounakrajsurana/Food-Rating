class User < ApplicationRecord
  has_many :stalls
  has_many :dishes
	has_many :ratings
  has_many :log_ratings
  # , dependent: :destroy
  attr_accessor :password
  # validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  # before_save :hash_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #before_save :assign_default_role

         # def admin?
         #   self.admin
         # end
         #
         # def set_admin
         #   self.admin = true
         # end
         #
         # def stall?
         #   self.stall
         # end
         #
         # def set_stall
         #   self.stall = true
         # end

         # private

         # def assign_default_role
         #   if current_user
         #     self.member = true
         #   end
         # end
       end

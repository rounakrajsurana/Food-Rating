class User < ApplicationRecord

  has_many :dishes
	has_many :ratings
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

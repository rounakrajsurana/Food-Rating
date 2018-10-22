class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         before_save :assign_default_role

         def admin?
           self.admin == true
         end

         def set_admin
           self.admin = true
         end

         private

         def assign_default_role
           if current_user
             self.admin = false if self.admin.nil?
           end
         end
       end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
  
  def member?
    self.role.name == "Member" if !self.role.blank?
  end

  # define the fuctions in ability.rb using handouts 4 please follow from the step 4 of cancancan
  
end

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all
    # return unless user && user.admin?

      if user.active
          can :read, :all
          if user.admin?
              can :manage, :all
              can :dashboard, :all
              can :access, :rails_admin       # only allow admin users to access Rails Admin
              # can :read, :dashboard           # allow access to dashboard

          elsif user.stall?
              # can :read, :all
              can :create, Rating
              can [:edit, :update, :destroy], Rating do |r|
                r.user == user
              end
              can :create, Dish
              can [:edit, :update, :destroy], Dish do |d|
                d.user == user
              end

          elsif user
              can :create, Rating
              can [:edit, :update, :destroy], Rating do |r|
                r.user == user
              end
              
          end
    # else
    #    can :read, :all
      elsif user.active==false
          format.html { redirect_to root_url, notice: 'Your account has been banned, Please contact Admin.' }
          format.json { head :no_content }
      end
  end
end

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all
    return unless user && user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :read, :dashboard           # allow access to dashboard
    if user.admin?
      can :manage, :all
    elsif user.stall?
      # can :read, :all
      can :create, Dish
      can [:update, :destroy], Dish do |d|
        d.user == user
      end
    elsif user
      # can :read, :all
      can :create, Rating
      can [:update, :destroy], Rating do |r|
        r.user == user
      end
    # else
    #    can :read, :all
       end
  end
end

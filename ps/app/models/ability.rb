class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif current_user?
      can :read, :all
      can :create, Rating
      can [:update, :destroy], Rating do |q|
        q.user == user
      end
    else
      can :read, Dish
    end
  end
end

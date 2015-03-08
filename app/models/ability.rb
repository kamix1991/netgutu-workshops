class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin? 
        can :manage, :all
        cannot :manage, Product
      else
        can [:new, :create], [Product, Review]
      end
      can :manage, Product, :user_id => user.id
    end
    can [:products, :reviews_list], User
    can [:index, :show], :all
  end
end

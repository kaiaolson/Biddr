class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #

    can :create, Bid
    cannot :create, Bid, auction: {user: user}

    can :manage, Auction, user_id: user.id
  end
end

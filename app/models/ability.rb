# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Recipe do |recipe|
      recipe.user_id == user.id
    end

    can :read, :all

    # can :destroy, Comment do |comment|
    #   comment.user_id == user.id
    # end

    # can :create, Post do |_post|
    #   user.id
    # end

    # can :create, Comment do |_comment|
    #   user.id
    # end



    # can :manage, Recipe, user_id: user.id
    # can :manage, Food, user_id: user.id
    # can :read, :all

      #   can :read, :all
      #   can :manage, Food, user_id: user.id
        # can :create, Recipe do |_recipe|
        #   user.id
        # end

        # can :destroy, Recipe do |recipe|
        #   recipe.user_id == user.id
        # end

        # can :create, Food do |_food|
        #   user.id
        # end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

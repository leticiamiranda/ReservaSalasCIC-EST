class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role? (:admin)
      can :manage, :all
    end
    if user.role? (:secretaria)
      can :manage, Reservas
      can :manage, Agendas
    end
    if user.role? (:professor)
      can :create, Agendas
      can :create, Reservas
    end
    if user.role? (:usuario)
      can :read, :all
    else
      can :read, :all  # para caso de usuario nao logado
    end
  end
end

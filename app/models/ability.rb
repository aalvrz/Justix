class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    alias_action :create, :read, :update, :destroy, :to => :crud
    
    # Admin User Privileges
    if user.admin?
      can :manage, :all
      
    # Regular User Privileges
    elsif user.id
    
      # Bufetes
      can :create, Bufete
      can :crud, Bufete, :user_id => user.id
    
      # Casos
      can :create, Caso
      can :crud, Caso, :bufete => { :user_id => user.id }

      # Personas
      can :create, Persona
      can :crud, Persona, :bufete => { :user_id => user.id }
      can :clientes, @clientes
      can :contrapartes, @contrapartes
      can :testigos, @testigos
      
      # Evidencia
      can :create, Prueba
      can :crud, Prueba, :caso => { :bufete => { :user_id => user.id } }
      
      # Bitacora
      can :create, Record
      can :crud, Record, :caso => { :bufete => { :user_id => user.id } }
      
      # Honorarios
      can :create, Honorario
      can :crud, Honorario, :caso => { :bufete => { :user_id => user.id } }
    end
    
    # Guest User Priveleges
    # can :read, :all
  end
end

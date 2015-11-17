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
      #can :view_json, :clients, :bufete => { :user_id => user.id } # Access for JSON data
      can :create, Persona
      can :crud, Persona, :bufete => { :user_id => user.id }
      
      # Evidencia
      can :create, Prueba
      can :crud, Prueba, :bufete => { :user_id => user.id }
      
      # Bitacora
      can :create, Record
      can :crud, Record, :bufete => { :user_id => user.id }
    end
    
    # Guest User Priveleges
    # can :read, :all
  end
end

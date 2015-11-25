class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  
  
    validates :nombre, :presence => true
    validates :apellido, :presence => true
         
    has_many :bufetes, dependent: :destroy
  
    PLANES_REGISTRO = ["Prueba", "Basico", "Premium"]
  
    def nombre_completo
        "#{self.nombre} #{self.apellido}"
    end
  
  
  
    # Determina cuantos casos se pueden crear de acuerdo al plan del usuario
    def bufete_limit
        1
    end
    
    def caso_limit
        count = case self.plan
            when "Prueba" then 1
            when "Basico" then 999  # Random big numbers
            when "Premium" then 999 # Random big numbers
        end
        count
    end
    
    def persona_limit
        count = case self.plan
            when "Prueba" then 1
            when "Basico" then 999  # Random big numbers
            when "Premium" then 999 # Random big numbers
        end
        count
    end
  
    def evidencia_limit
        count = case self.plan
            when "Prueba" then 0
            when "Basico" then 999  # Random big numbers
            when "Premium" then 999 # Random big numbers
        end
        count
    end
  
end

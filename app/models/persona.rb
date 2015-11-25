class Persona < ActiveRecord::Base
    
    # STI Column
    self.inheritance_column = :type
    
    # Validations
    validates :nombre, :presence => true
    validates :apellido, :presence => true
    validates :type, :presence => true

    validate :personas_count_within_limit, on: :create

    # Associations
    belongs_to :bufete
    has_many :caso_personas
    has_many :casos, through: :caso_personas
    
    # We will need a way to know which persons
    # will subclass the Persona model
    def self.types
      %w(Cliente Testigo Contraparte)
    end
    
    # Inheritance Scopes
    scope :clientes, -> { where(type: 'Cliente') }
    scope :contrapartes, -> { where(type: 'Contraparte') }
    scope :testigos, -> { where(type: 'Testigo') }
    
    PERSONA_TYPES = ["Cliente", "Contraparte", "Testigo"]
    
    def nombre_completo
        "#{self.nombre} #{self.apellido}"
    end
    
    def personas_count_within_limit
        if self.bufete.personas(:reload).count >= self.bufete.user.persona_limit # self is optional
            errors.add(:base, 'Tu plan actual no te permite crear mas personas, actualiza tu plan!')
        end
    end
end
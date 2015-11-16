class Persona < ActiveRecord::Base
    
    # STI Column
    self.inheritance_column = :type
    
    # Validations
    validates :nombre, :presence => true
    validates :num_registro, :presence => true
    validates :apellido, :presence => true
    #validates :birth, :presence => true
    validates :telefono, :presence => true
    validates :estado_civil, :presence => true
    validates :email, :presence => true
    validates :domicilio, :presence => true
    validates :type, :presence => true

    # Associations
    belongs_to :bufete
    has_many :caso_personas
    has_many :casos, through: :caso_personas
    
    # We will need a way to know which persons
    # will subclass the Perso model
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
    
    
end
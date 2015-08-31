class Caso < ActiveRecord::Base
    
    attr_reader :client_tokens
    attr_reader :counterpart_tokens
    attr_reader :witness_tokens
    
    validates :nombre, :presence => true
    validates :num_accion, :presence => true
    validates :accion, :presence => true
    validates :materia, :presence => true
    validates :oficina, :presence => true
    
    has_many :caso_personas
    #has_many :clientes, class_name: 'Cliente', through: :caso_personas, source: :personas
    #has_many :contrapartes, class_name: 'Contraparte', through: :caso_personas, source: :personas
    #has_many :testigos, class_name: 'Testigo', through: :caso_personas, source: :personas
    
    has_many :personas, through: :caso_personas
    
    delegate :clientes, :contrapartes, :testigos, to: :personas
    
    def client_tokens=(ids)
        self.client_tokens = ids.split(",")
    end
    
    def witness_tokens=(ids)
        self.witness_tokens = ids.split(",")
    end
    
    def counterpart_tokens=(ids)
        self.counterpart_tokens = ids.split(",")
    end
end

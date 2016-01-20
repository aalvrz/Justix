class Bufete < ActiveRecord::Base
    extend FriendlyId
    friendly_id :nombre, use: :slugged
    
    validates :nombre, :presence => true
    validates :direccion, :presence => true
    validates :telefono, :presence => true
    
    belongs_to :user
    
    has_many :personas, dependent: :destroy
    has_many :casos, dependent: :destroy
    
    # Assocations Stack Overflow Question:
    # http://stackoverflow.com/questions/31873297/choosing-the-right-model-associations-in-rails-4
    
    # Single Table Inheritance Post:
    # http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/
    
    delegate :clientes, :contrapartes, :testigos, to: :personas
end


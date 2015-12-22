class Record < ActiveRecord::Base
    belongs_to :caso
    
    validates :visita, :presence => true
end

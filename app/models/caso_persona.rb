class CasoPersona < ActiveRecord::Base
    belongs_to :persona
    belongs_to :caso
end

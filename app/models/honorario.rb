class Honorario < ActiveRecord::Base
    belongs_to :caso
    
    validates :fecha, :presence => true
    validates :abono, :presence => true
end

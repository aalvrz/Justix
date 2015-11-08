class Prueba < ActiveRecord::Base
    
    belongs_to :caso
    
    validates :titulo, :presence => true
    validates :descripcion, :presence => true
    
    mount_uploader :archivo, EvidenciaUploader
end

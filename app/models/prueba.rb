class Prueba < ActiveRecord::Base
    
    belongs_to :caso
    
    validates :titulo, :presence => true
    validates :descripcion, :presence => true
    
    validate :pruebas_count_within_limit, on: :create
    
    mount_uploader :archivo, EvidenciaUploader
    
    
    def pruebas_count_within_limit
        if self.caso.pruebas(:reload).count >= self.caso.bufete.user.evidencia_limit
            errors.add(:base, 'Tu plan actual no te permite crear mas pruebas, actualiza tu plan!')
        end
    end
end

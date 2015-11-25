class Prueba < ActiveRecord::Base
    
    belongs_to :caso
    
    validates :titulo, :presence => true
    validates :descripcion, :presence => true
    
    validate :pruebas_count_within_limit, on: :create
    
    mount_uploader :archivo, EvidenciaUploader
    
    
    def pruebas_count_within_limit
        if self.caso.pruebas(:reload).count >= self.caso.bufete.user.evidencia_limit # self is optional
            errors.add(:base, 'Tu plan actual no te permite crear mas evidencia, actualiza tu plan!')
        end
    end
end

class PaginasController < ApplicationController
    
    layout 'home'
    
    def home
    end
    
    def planes
        @title = "Planes"
    end
    
    def privacidad
        @title = "Politica de Privacidad"
    end
    
    def terminos
        @title = "Terminos y Condiciones"
    end
    
    def acerca
        @title = "Acerca De #{APP_NAME}"
    end
    
    def faq
        @title = "FAQ (Preguntas mas Frecuentes)"
    end
    
    def prueba
        @title = "Prueba #{APP_NAME} Gratis"
    end
        
end

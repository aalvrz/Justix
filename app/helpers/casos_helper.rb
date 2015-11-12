module CasosHelper
    
    def caso_estado_contextual(estado)
        if estado == "En Proceso"
            "proceso"
        elsif estado == "Ganado"
            "ganado"
        elsif estado == "Perdido"
            "perdido"
        end
    end
    
    def get_evidencia_icon extension
        case extension
        when "txt", "doc", "pdf"
            "file-text-o"
        when "jpg", "jpeg", "png"
            "file-image-o"
        end
    end
end

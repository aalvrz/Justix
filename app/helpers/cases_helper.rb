module CasesHelper
    
    def caso_estado_contextual(estado)
        if estado == "En Proceso"
            "warning"
        elsif estado == "Ganado"
            "success"
        elsif estado == "Perdido"
            "danger"
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

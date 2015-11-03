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
end

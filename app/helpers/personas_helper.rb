module PersonasHelper
    
    def sti_persona_path(type = "persona", persona = nil, action = nil)
        send "#{format_sti(action, type, persona)}_path", persona
    end

    def format_sti(action, type, persona)
        action || persona ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
    end

    def format_action(action)
        action ? "#{action}_" : ""
    end
    
end

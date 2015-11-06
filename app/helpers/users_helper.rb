module UsersHelper
    
    def plan_es_valido? plan
        User::PLANES_REGISTRO.include? plan
    end
end

class PanelController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @title = "Panel de Control"
    end
    
    def admin
        @users = User.all
        @bufetes = Bufete.all
        @title = "Panel de Administracion"
        
        authorize! :admin, current_user
    end
end

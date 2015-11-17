class PanelController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        
    end
    
    def admin
        @users = User.all
        @bufetes = Bufete.all
        
        authorize! :admin, current_user
    end
end

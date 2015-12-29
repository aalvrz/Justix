class BufetesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_bufete, only:[:show, :edit, :update, :destroy]
    
    load_and_authorize_resource
    
    def index
        @bufetes = current_user.bufetes
    end
    
    def show
        @title = @bufete.nombre
    end
    
    def new
        @bufete = Bufete.new
    end
    
    def create
        @bufete = current_user.bufetes.build(bufete_params)
   
        respond_to do |format|
            if @bufete.save
                format.html { redirect_to @bufete, :flash => { :success => 'Tu bufete ha sido creado exitosamente. Ahora puedes comenzar a registar y manejar personas y casos.' } }
            else
                format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de crear tu bufete.' } }
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @bufete.update(bufete_params)
                format.html { redirect_to @bufete, :flash => { :success => 'Tu bufete ha sido editado exitosamente.' } }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar tu bufete.' } }
            end
        end 
    end
    
    def destroy
        @user = current_user
        #@user.bufete = nil      # Remove assigned Bufete from user
        #@user.owner = false     # Remove owner status
        
        respond_to do |format|
            if @user.save && @bufete.destroy
                format.html { redirect_to root_path, :flash => { :success => 'Tu bufete ha sido eliminado exitosamente.' } }
            end
        end 
    end
    
    private
        
        def find_bufete
            @bufete = Bufete.find(params[:id])
        end
        
        def bufete_params
            params.require(:bufete).permit(:nombre, :direccion, :telefono, :descripcion, :movil, :user_id)
        end
    
end

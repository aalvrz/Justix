class BufetesController < ApplicationController
    
    before_action :find_bufete, only:[:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
        @bufetes = current_user.bufetes
    end
    
    def show
    end
    
    def new
        @bufete = Bufete.new
    end
    
    def create
        @bufete = current_user.bufetes.build(bufete_params)
        #@user.owner = true      # Mark this user as an owner
   
        respond_to do |format|
            if @bufete.save
                format.html { redirect_to @bufete, :flash => { :success => 'Tu bufete ha sido creado exitosamente.' } }
                format.json { render :show, status: :created, location: @bufete }
            else
                format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de crear tu bufete.' } }
                format.json { render json: @bufete.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @bufete.update(bufete_params)
                format.html { redirect_to @bufete, :flash => { :success => 'Tu bufete ha sido editado exitosamente.' } }
                format.json { render :show, status: :updated, location: @bufete }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar tu bufete.' } }
                format.json { render json: @bufete.errors, status: :unprocessable_entity }
            end
        end 
    end
    
    def destroy
        @user = current_user
        @user.bufete = nil      # Remove assigned Bufete from user
        @user.owner = false     # Remove owner status
        
        respond_to do |format|
            if @user.save && @bufete.destroy
                format.html { redirect_to root_path, :flash => { :success => 'Tu bufete ha sido eliminado exitosamente.' } }
                format.json { redirect_to root_path, status: :destroyed, location: @bufete }
            end
        end 
    end
    
    private
        
        def find_bufete
            @bufete = Bufete.find(params[:id])
        end
        
        def bufete_params
            params.require(:bufete).permit(:nombre, :direccion, :telefono, :descripcion, :user_id)
        end
    
end

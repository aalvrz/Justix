class CasosController < ApplicationController
    
    before_action :find_bufete
    before_action :find_caso, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        
    end
    
    def show
    end
    
    def new
        @caso = Caso.new
    end
    
    def edit
    end
    
    def create
        @clientes = params[:client_tokens]  # Get all the clients assigned using the Token Input
        @caso = Caso.new(caso_params)
        @caso.persona_ids = params[:client_tokens].split(",") + params[:witness_tokens].split(",") + params[:counterpart_tokens].split(",")
        
        respond_to do |format|
            if @caso.save
                format.html { redirect_to bufete_caso_path(@bufete, @caso), :flash => { :success => 'Caso ha sido creado exitosamente' } }
                format.json { render :show, status: :created, location: @caso }
            else
                format.html { render :action => "new", :flash => { :danger => 'Hubo un error al tratar de crear el caso.' } }
                format.json { render json: @caso.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        respond_to do |format|
            if @caso.destroy
                format.html { redirect_to @bufete, :flash => { :success => "El caso '#{@caso.nombre}' ha sido eliminado del sistema exitosamente." } }
            end
        end
    end
    
    
    private
    
        def find_bufete
           @bufete = Bufete.find(params[:bufete_id]) 
        end
    
        def find_caso
            @caso = Caso.find(params[:id])
        end
        
        def caso_params
           params.require(:caso).permit(:nombre, :num_accion, :accion, :materia, :oficina, :descripcion, :terminado, :bufete_id, :client_tokens, :witness_tokens, :counterpart_tokens) 
        end
end

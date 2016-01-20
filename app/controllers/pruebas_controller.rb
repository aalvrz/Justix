class PruebasController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_caso
    before_action :find_bufete
    before_action :find_prueba, only: [:show, :edit, :update, :destroy]
    
    load_and_authorize_resource :through => :caso
    
    def index
        @pruebas = @caso.pruebas.uniq
    end
    
    def new
        @prueba = @caso.pruebas.build
        @title = "Agregar Prueba"
    end
    
    def create
       @prueba = @caso.pruebas.build(prueba_params)
        
        respond_to do |format|
            if @prueba.save
                format.html { redirect_to bufete_caso_path(@bufete, @caso), :flash => { :success => 'Evidencia ha sido agregada exitosamente' } }
            else
                format.html { render :action => "new", :flash => { :danger => 'Hubo un error al tratar de agregar la evidencia.' } }
            end
        end 
    end
    
    def show
    end
    
    def edit
        @title = "Editar Prueba"
    end
    
    def update
        respond_to do |format|
            if @prueba.update(prueba_params)
                format.html { redirect_to [@bufete,@caso], :flash => { :success => 'La evidencia ha sido editada exitosamente.' } }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar la evidencia.' } }
            end
        end
    end
    
    def destroy
        # First, delete the file
        @prueba.remove_archivo!
        @prueba.save
        
        respond_to do |format|
            if @prueba.destroy
                
                format.html { redirect_to [@bufete, @caso], :flash => { :success => "La evidencia '#{@prueba.titulo}' ha sido eliminada del sistema exitosamente." } }
            end
        end
    end
    
    
    
    private
    
        def find_bufete
            @bufete = @caso.bufete
        end
        
        def find_caso
            @caso = Caso.friendly.find(params[:caso_id])
        end
        
        def find_prueba
            @prueba = Prueba.find(params[:id])
        end
        
        def prueba_params
            params.require(:prueba).permit(:titulo, :descripcion, :fecha, :archivo)
        end
end

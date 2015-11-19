class RecordsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_caso
    before_action :find_bufete
    before_action :find_record, only: [:edit, :update, :destroy]
    
    load_and_authorize_resource :through => :caso
    
    def new
        @record = @caso.records.build
        @title = "Crear Entrada de Bitacora"
    end
    
    def create
        @record = @caso.records.build(record_params)
        respond_to do |format|
            if @record.save
                format.html { redirect_to bufete_caso_path(@bufete, @caso), :flash => { :success => 'La entrada ha sido agregada exitosamente a la bitacora.' } }
            else
                format.html { render :action => "new", :flash => { :danger => 'Hubo un error al tratar de agregar la entrada.' } }
            end
        end
    end
    
    def edit
        @title = "Editar Entrada de Bitacora"
    end
    
    def update
        respond_to do |format|
            if @record.update(record_params)
                format.html { redirect_to [@bufete,@caso], :flash => { :success => 'La entrada ha sido editada exitosamente.' } }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar la entrada.' } }
            end
        end
    end
    
    def destroy
        respond_to do |format|
            if @record.destroy
                format.html { redirect_to [@bufete, @caso], :flash => { :success => "La entrada ha sido eliminada del sistema exitosamente." } }
            end
        end
    end
    
    
    private
    
        def record_params
           params.require(:record).permit(:visita, :instancia, :folio, :actuacion, :notificacion_cliente, :fecha_contraparte, :observaciones, :caso_id) 
        end
    
        def find_caso
            @caso = Caso.find(params[:caso_id])
        end
        
        def find_bufete
            @bufete = Bufete.find(params[:bufete_id])
        end
        
        def find_record
            @record = Record.find(params[:id])
        end
end

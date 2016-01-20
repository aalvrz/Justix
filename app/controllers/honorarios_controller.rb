class HonorariosController < ApplicationController
    before_action :authenticate_user!
    before_action :find_caso
    before_action :find_bufete
    before_action :find_honorario, only: [:edit, :update, :destroy]
    
    def new
        @honorario = @caso.honorarios.build
        @title = "Registrar honorarios."
    end
    
    def create
       @honorario = @caso.honorarios.build(honorario_params)
       
       respond_to do |format|
            if @honorario.save
                format.html { redirect_to bufete_caso_path(@bufete, @caso), :flash => { :success => 'Honorario registrado exitosamente.' } }
            else
                format.html { render :action => "new", :flash => { :danger => 'Hubo un error al tratar de registrar el honorario.' } }
            end
        end
    end
    
    def edit
        @title = "Editar honorario."
    end
    
    def update
       respond_to do |format|
            if @honorario.update(honorario_params)
                format.html { redirect_to [@bufete,@caso], :flash => { :success => 'Honorario editado exitosamente.' } }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar el honorario.' } }
            end
        end 
    end
    
    def destroy
       respond_to do |format|
            if @honorario.destroy
                format.html { redirect_to [@bufete, @caso], :flash => { :success => "Honorario eliminado exitosamente del sistema." } }
            end
        end 
    end
    
    private
    
        def honorario_params
           params.require(:honorario).permit(:fecha, :abono, :caso_id) 
        end
    
        def find_caso
            @caso = Caso.friendly.find(params[:caso_id])
        end
        
        def find_bufete
           @bufete = Bufete.friendly.find(params[:bufete_id]) 
        end
        
        def find_honorario
            @honorario = Honorario.find(params[:id])
        end
end

class PersonasController < ApplicationController
    
    before_action :find_bufete
    before_action :find_persona, only:[:show, :edit, :update, :destroy]
    before_action :set_type
    before_action :authenticate_user!
    
    def index
       @personas = type_class.all.where("nombre like ? OR apellido like ?", "%#{params[:q]}%", "%#{params[:q]}%")
       
        # Generate JSON Script for Token Input Plugin
        respond_to do |format|
            format.html
            format.json { render :json => @personas.map { |model| {:id => model.id, :nombre_completo => model.nombre_completo } } }
        end
    end
    
    def new
        @persona = @bufete.personas.build
    end
    
    def create
        @persona = @bufete.personas.build(persona_params)
    
        respond_to do |format|
            if @persona.save
                format.html { redirect_to bufete_persona_path(@bufete, @persona), :flash => { :success => 'La persona ha sido registrada exitosamente' } }
                format.json { render :show, status: :created, location: @persona }
            else
                format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de registrar la persona.' } }
                format.json { render json: @persona.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @persona.update(persona_params)
                format.html { redirect_to @persona, :flash => { :success => 'Persona ha sido editada exitosamente.' } }
                format.json { render :show, status: :updated, location: @persona }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar la persona.' } }
                format.json { render json: @persona.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def show
    end
    
    def destroy
        respond_to do |format|
            if @persona.destroy
                format.html { redirect_to @bufete, :flash => { :success => 'La persona ha sido eliminada del sistema exitosamente.' } }
            end
        end
    end
    
    private
    
        def find_bufete
            @bufete = Bufete.find(params[:bufete_id])
        end
    
        def find_persona
           @persona = Persona.find(params[:id]) 
        end
        
        def set_type
           @type = type 
        end
        
        def type
           Persona.types.include?(params[:type]) ? params[:type] : "Persona"
        end
        
        def type_class
            type.constantize
        end
        
        def persona_params
           params.require(:persona).permit(:nombre, :apellido, :email, :num_registro, :estado_civil, :telefono, 
           :domicilio, :photo, :type, :bufete_id) 
        end
end

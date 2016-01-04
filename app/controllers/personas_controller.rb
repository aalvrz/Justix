class PersonasController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_bufete
    before_action :find_persona, only:[:show, :edit, :update, :destroy]
    before_action :set_type
    
    load_and_authorize_resource :bufete
    load_and_authorize_resource :through => :bufete, except: [:clientes, :contrapartes, :testigos]
    
    def clientes
        authorize! :clientes, @clientes
        @clientes = @bufete.clientes.all.where("nombre LIKE ? OR apellido LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
        respond_to do |format|
            format.json { render :json => @clientes.map { |model| {:id => model.id, :nombre_completo => model.nombre_completo } } }
        end
    end
    
    def contrapartes
        authorize! :contrapartes, @contrapartes
        @contrapartes = @bufete.contrapartes.all.where("nombre LIKE ? OR apellido LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
        respond_to do |format|
            format.json { render :json => @contrapartes.map { |model| {:id => model.id, :nombre_completo => model.nombre_completo } } }
        end
    end
    
    def testigos
        authorize! :testigos, @testigos
        @testigos = @bufete.testigos.all.where("nombre LIKE ? OR apellido LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
        respond_to do |format|
            format.html
            format.json { render :json => @testigos.map { |model| {:id => model.id, :nombre_completo => model.nombre_completo } } }
        end
    end
    
    def index
       @personas = @bufete.personas.all
       
       # Pagination
       @personas = @personas.paginate(:page => params[:page], :per_page => 6)
       
       @title = "Mis Personas"
    end
    
    def new
       @persona = @bufete.personas.build
       @title = "Registrar Nueva Persona"
    end
    
    def create
        @persona = @bufete.personas.build(persona_params)
    
        respond_to do |format|
            if @persona.save
                format.html { redirect_to bufete_persona_path(@bufete, @persona), :flash => { :success => 'La persona ha sido registrada exitosamente' } }
                format.js
            else
                format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de registrar la persona.' } }
                format.js   { render json: @persona.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @persona.update(persona_params)
                format.html { redirect_to [@bufete, @persona], :flash => { :success => 'La persona ha sido editada exitosamente.' } }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar la persona.' } }
            end
        end
    end
    
    def edit
        @title = "Editar Persona'"
    end
    
    def show
        @title = @persona.nombre_completo
    end
    
    def destroy
        respond_to do |format|
            if @persona.destroy
                format.html { redirect_to bufete_personas_path(@bufete), :flash => { :success => 'La persona ha sido eliminada del sistema exitosamente.' } }
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
           params.require(type.downcase.to_sym).permit(:nombre, :apellido, :email, :num_registro, :fecha_nacimiento, :estado_civil, :telefono, :movil, :domicilio, :type, :bufete_id) 
        end
end

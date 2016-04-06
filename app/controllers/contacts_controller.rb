class ContactsController < ApplicationController
    
    layout 'home'
    
    def new
        @contact = Contact.new
        
        # Page Title
        @title = "Contactanos"
    end

    def create
        @contact = Contact.new(contact_params)
        @contact.request = request
        
        if @contact.deliver
            #flash.now[:success] = 'Gracias por tu mensaje, te contactaremos pronto.'
        else
            flash.now[:danger] = 'Hubo un error al tratar de enviar tu mensaje. Asegurate que todos los campos fueron llenados.'
            render :new
        end
    end
    
    private
    
        def contact_params
           params.require(:contact).permit(:name, :email, :subject, :message)
        end
    
end

require 'rails_helper'

describe BufetesController do
    describe 'POST #create' do
        
        context 'with valid attributes' do
            it 'creates the bufete' do
                post :create, bufete: attributes_for(:bufete)
                expect(Bufete.count).to eq(1)
            end
            
            it 'redirects to the show action for the new Bufete' do
               post :create, bufete: attributes_for(:bufete)
               expect(response).to redirect_to Bufete.first
            end
        end
        
        context 'with invalid attributes' do
            it 'does not create the bufete' do
                post :create, bufete: attributes_for(:bufete, nombre: nil)
                expect(Bufete.count).to eq(0)
            end
            
            it 're-renders the new view' do
               post :create, bufete: attributes_for(:bufete, nombre: nil)
               expect(response).to render_template :new
            end
        end
           
    end
    
end
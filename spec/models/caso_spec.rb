require 'rails_helper'

define Caso do
   
    it 'has a valid factory' do
        expect(build(:caso)).to be_valid   
    end
   
    it 'is invalid without a name' do
       expect(build(:caso, nombre: nil)).to_not be_valid 
    end
    
    it 'is invalid without an action number' do
       expect(build(:caso, num_accion: nil)).to_not be_valid 
    end
    
end
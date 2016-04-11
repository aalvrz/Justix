require 'rails_helper'

describe Bufete do
    
    it 'has a valid factory' do
       expect(build(:bufete)) 
    end
    
    it 'is invalid without a name' do
       expect(build(:bufete, nombre: nil)).to_not be_valid 
    end
    
    it 'is invalid without an address' do
       expect(build(:bufete, direccion: nil)).to_not be_valid
    end
    
    it 'is invalid without a phone number' do
       expect(build(:bufete, telefono: nil)).to_not be_valid 
    end
    
end
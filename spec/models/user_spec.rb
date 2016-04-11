require 'rails_helper'

describe User do
    
    it 'has a valid factory' do
        expect(build(:user)).to be_valid 
    end
    
    it 'is invalid without a name' do
        expect(build(:user, nombre: nil)).to_not be_valid 
    end
    
    it 'is invalid without a last name' do
        expect(build(:user, apellido: nil)).to_not be_valid 
    end
    
    it 'is invalid without an email' do
        expect(build(:user, email: nil)).to_not be_valid 
    end
    
    it 'is invalid without a plan' do
        expect(build(:user, plan: nil)).to_not be_valid 
    end
    
end
FactoryGirl.define do
    factory :user do
        nombre 'test'
        apellido 'test'
        email 'test@test.com'
        password '12345678'
        password_confirmation '12345678'
        plan 'Prueba'
    end
end
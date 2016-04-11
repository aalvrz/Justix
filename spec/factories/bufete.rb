FactoryGirl.define do
    factory :bufete do
        nombre 'Bufete Testing'
        direccion 'El Chiverito'
        telefono '22398954'
        association :user
    end
end
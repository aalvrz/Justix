Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    get 'registro', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  
  get 'mi_bufete', to: 'bufetes#show'
  
  resources :bufetes do
    resources :personas
    resources :clientes, controller: 'personas', type: 'Cliente'
    resources :contrapartes, controller: 'personas', type: 'Contraparte'
    resources :testigos, controller: 'personas', type: 'Testigo'
    
    resources :casos
  end
  
  root 'home#index'  
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  
  devise_scope :user do
    get 'registrarse', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'recuperar_pass', to: 'devise/passwords#new'
  end
  
  resources :bufetes do
    resources :personas
    get 'clientes', to: 'personas#clientes'
    get 'contrapartes', to: 'personas#contrapartes'
    get 'testigos', to: 'personas#testigos'
    
    resources :clientes, controller: 'personas', type: 'Cliente'
    resources :contrapartes, controller: 'personas', type: 'Contraparte'
    resources :testigos, controller: 'personas', type: 'Testigo'
    
    resources :casos do
      resources :pruebas
    end
  end
  
  get 'mi_bufete', to: 'bufetes#show'
  get 'crear_bufete', to: 'bufetes#new'
  
  get 'planes', to: 'paginas#planes'
  
  get 'panel', to: 'panel#index'
  
  root 'paginas#home'  
end

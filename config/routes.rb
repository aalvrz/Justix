Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "registrations" }
  
  devise_scope :user do
    get 'registrarse', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'recuperar_pass', to: 'devise/passwords#new'
    get 'nuevo_pass', to: 'devise/passwords#edit'
  end
  
  resources :bufetes do
    resources :personas
    
    # JSON Routes
    get 'clientes', to: 'personas#clientes'
    get 'contrapartes', to: 'personas#contrapartes'
    get 'testigos', to: 'personas#testigos'
    
    # STI Routes
    resources :clientes, controller: 'personas', type: 'Cliente'
    resources :contrapartes, controller: 'personas', type: 'Contraparte'
    resources :testigos, controller: 'personas', type: 'Testigo'
    
    resources :casos do
      resources :pruebas
      resources :records
      resources :honorarios
    end
  end
  
  resources :coupons
  
  get 'mi_bufete', to: 'bufetes#show'
  get 'crear_bufete', to: 'bufetes#new'
  
  # Static Pages
  get 'planes', to: 'paginas#planes'
  get 'privacidad', to: 'paginas#privacidad'
  get 'terminos', to: 'paginas#terminos'
  get 'acerca', to: 'paginas#acerca'
  get 'faq', to: 'paginas#faq'
  get 'prueba', to: 'paginas#prueba'
  
  # Admin Panel
  get 'admin', to: 'panel#admin'
  
  # Contact
  resources :contacts, only: [:new, :create]
  get 'contacto', to: 'contacts#new'
  
  root 'paginas#home'  
end

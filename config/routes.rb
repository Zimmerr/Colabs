Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "auth#login"
  get 'landing', to: 'auth#login'
  get "meus_projetos", to: "projects#index"
  get "cadastrar_usuario", to: "users#new"
  get "teste", to: "inicial#index"
  get 'enter', to: 'auth#new'
  post 'enter', to: 'auth#create'


  resources :projects
  resources :users, only: [:new, :create]

end

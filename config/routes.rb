Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "auth#login"
  get 'landing', to: 'auth#login'
  get "cadastrar_usuario", to: "users#new"
  get "editar_usuario", to: "users#edit"
  get "index", to: "inicial#index"
  get 'enter', to: 'auth#new'
  post 'enter', to: 'auth#create'

  resources :users, only: [:new, :create, :update]

end

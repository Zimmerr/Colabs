Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "auth#login"
  get 'landing', to: 'auth#login'
  get "cadastrar_usuario", to: "users#new"
  get "index", to: "inicial#index"
  get 'enter', to: 'auth#new'
  post 'enter', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'

  resources :users, only: [:new, :create]

  resources :auth, only: [:login, :create, :destroy]

end

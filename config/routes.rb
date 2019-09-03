Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "auth#login"
  get "cadastrar_usuario", to: "users#new"

  resources :users, only: [:new, :create]

end

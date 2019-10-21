Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "auth#login"
  get 'landing', to: 'auth#login'
  get 'project_tasks', to: 'tasks#tasks'
  get "meus_projetos", to: "projects#index"
  get "cadastrar_usuario", to: "users#new"
  get "editar_usuario", to: "users#edit"
  get "index", to: "inicial#index"
  get 'enter', to: 'auth#new'
  post "/addprojectuser/:id", to: "project_users#create", as: "adduser"
  get "/rmprojectuser/:id", to: "project_users#remove", as: "rmuser"
  post 'enter', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'

  resources :users, only: [:new, :create, :update]

  resources :auth, only: [:login, :create, :destroy]

  resources :projects

  resources :project_users
end

Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "auth#login"
  get 'landing', to: 'auth#login'
  get 'new_task', to: 'tasks#new'
  get 'edit_task', to: 'tasks#edit'
  get 'project_task', to: 'tasks#index'
  get "meus_projetos", to: "projects#index"
  get "cadastrar_usuario", to: "users#new"
  get "editar_usuario", to: "users#edit"
  get "index", to: "inicial#index"
  get 'enter', to: 'auth#new'
  post "/addprojectuser/:id", to: "project_users#create", as: "adduser"
  get "/rmprojectuser/:id", to: "project_users#remove", as: "rmuser"
  get "/change_level/:id", to: "project_users#change_level", as: "changelevel"
  #get "cl", to: 'project_users#change_level'
  post 'enter', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'

  get 'listas_projeto/:project_id', to: "lists#index", as: 'listas_projeto'
  post 'listas_projeto/:project_id', to: "lists#create", as: 'create_list'
  get 'listas_projeto/:project_id/:list_id', to: "lists#edit", as: 'edit_list'
  put 'listas_projeto/:project_id/:list_id', to: "lists#update", as: 'update_list'

  resources :users, only: [:new, :create, :update]

  resources :auth, only: [:login, :create, :destroy]

  resources :projects

  resources :tasks

  resources :lists

  resources :project_users
end

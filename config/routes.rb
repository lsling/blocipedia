Rails.application.routes.draw do

  resources :wikis do
      resources :collaborators, only: [:create, :destroy]
  end

  post 'add_collaborator/:id' => 'wikis#add_as_collaborator', as: "add_collaborator"
  get 'remove_collaborator/:id' => 'wikis#remove_as_collaborator', as: "remove_collaborator"

  resources :charges, only: [:new, :create]
  resources :wikis
  devise_for :users

  get "users/downgrade" => "users#downgrade"
  post "users/downgrade" => "users#downgrade"

  get 'about' => 'welcome#about'

  root 'welcome#index'
end

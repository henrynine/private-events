Rails.application.routes.draw do
  root "static_pages#home"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end

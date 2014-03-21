DataEngineering::Application.routes.draw do
  resources :purchases

  resources :merchants

  resources :items

  resources :customers

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
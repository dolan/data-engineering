DataEngineering::Application.routes.draw do
  resources :data_file_uploads

  resources :purchases

  resources :merchants

  resources :items

  resources :customers

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
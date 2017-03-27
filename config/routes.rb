Rails.application.routes.draw do
  get '/search' => 'store#search'

  get '/search_results' => 'store#search_results'

  # get 'products/index'

  # get 'products/show'

  get 'pages/:page' => 'pages#show'

  # get '/about' => 'pages#show'
  # get '/contact' => 'pages#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources 'products', only: [:index, :show]
  resources 'pages', only: [:show]

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  get '/search' => 'store#search'

  get '/search_results' => 'store#search_results'

  # get 'products/index'

  # get 'products/show'

  get 'page/:page' => 'pages#show', as: 'page'

  # get '/about' => 'pages#show'
  # get '/contact' => 'pages#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources 'products', only: [:index, :show]
  #resources 'pages', only: [:show]

  #set login url to login page an
  as :user do
    get '/login', to: 'devise/sessions#new'
  end
  #set logout page
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

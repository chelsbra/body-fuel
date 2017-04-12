Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  #devise_for :users
  get '/search' => 'store#search'

  get '/search_results' => 'store#search_results'

  get 'page/:page' => 'pages#show', as: 'page'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources 'products', only: [:index, :show]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  #set login url to login page an
  as :user do
    get '/login', to: 'devise/sessions#new'
  end
  #set logout page
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  #tell devise to use registrations_controller
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :charges

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

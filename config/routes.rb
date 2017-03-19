Rails.application.routes.draw do
  # get 'products/index'

  # get 'products/show'

  get 'pages/:page' => 'pages#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources 'products', only: [:index, :show]

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

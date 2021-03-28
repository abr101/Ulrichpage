Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :sub_categories
  resources :categories
  resources :cities
  resources :states
  resources :countries
  resources :continents
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'  }
  get 'dashboard/show'
  get  'dashboard/signout'
  root 'post_ads#index'
  resources :post_ads
  get 'dashboard/login_page'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

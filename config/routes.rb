Rails.application.routes.draw do
  resources :reports
  resources :replies
  mount Ckeditor::Engine => '/ckeditor'
  resources :sub_categories
  resources :categories
  resources :cities
  resources :states
  resources :countries
  resources :continents
  resources :charges, only: [:new, :create] do
    collection do
      get :pay
    end
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'  }
  root 'dashboard#show'
  get  'dashboard/signout'
  get  'dashboard/decide'
  get  'dashboard/search'
  #root 'post_ads#index'
  resources :post_ads do
    collection do
      get :published_adz
    end
  end
  get 'dashboard/login_page'
  get 'dashboard/store'
  get 'dashboard/giveaway'
  get 'dashboard/contact_us'
  get 'dashboard/about_us'
  get 'dashboard/terms'
  get 'dashboard/privacy'
  get 'dashboard/report_captcha'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

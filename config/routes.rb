Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :reports do 
    collection do
      get :recapcha_submit
    end
  end
  resources :replies
  mount Ckeditor::Engine => '/ckeditor'
  resources :sub_categories do
    collection do
      get :disclaimer
    end
  end
  resources :categories do
    collection do
      get :catpage
    end
  end
  resources :cities
  resources :states
  resources :countries
  resources :continents
  resources :charges, only: [:new, :create] do
    collection do
      get :pay
      get :specific
    end
  end
 
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'  }
  root 'dashboard#main'
  get 'dashboard/catshow'
  get 'dashboard/show'
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
  get 'reports/recaptcha'
  resources :user_informations do 
    collection do
      get :page 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

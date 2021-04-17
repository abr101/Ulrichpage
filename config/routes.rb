Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'  }
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do  
    resources :reports
    resources :replies
    mount Ckeditor::Engine => '/ckeditor'
    resources :sub_categories
    resources :categories
    resources :cities
    resources :states
    resources :countries
    resources :continents
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

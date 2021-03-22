Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'  }
  get 'dashboard/show'
  get  'dashboard/signout'
  root 'post_ads#index'
  resources :post_ads
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :post_ads
  root 'post_ads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

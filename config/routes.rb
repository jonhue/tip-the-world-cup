Rails.application.routes.draw do
  resources :nations
  resources :tips
  resources :matches
  resources :games
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

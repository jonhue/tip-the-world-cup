Rails.application.routes.draw do
  mount Pwa::Engine, at: ''

  constraints subdomain: '' do
    scope :app do
      devise_for :users
      root to: 'games#index'
      resources :games, except: [:index] do
        get 'invite', to: 'games#invite', on: :member
        resources :participants, except: [:edit, :update] do
          resources :tips, except: [:new, :edit]
        end
        resources :matches, only: [:index, :show]
        resources :nations, only: [:show]
      end
    end
    root to: 'welcome#index'
  end

  match '*path', to: 'r404#not_found', via: :all
end

Rails.application.routes.draw do
  resources :invitations
  mount Pwa::Engine, at: ''

  constraints subdomain: '' do
    scope :app do
      devise_for :users
      root to: 'games#index'
      resources :games, except: [:index, :edit] do
        resources :invitations, only: [:show, :new, :create]
        resources :participants, except: [:edit, :update] do
          resources :tips, except: [:show, :new, :edit]
          resources :tips, only: [:show], constraints: Modalist::Ajax.new
        end
        resources :matches, only: [:index, :show]
        resources :nations, only: [:show]
      end
    end
    root to: 'welcome#index'
  end

  match '*path', to: 'r404#not_found', via: :all
end

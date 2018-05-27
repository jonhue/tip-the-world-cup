Rails.application.routes.draw do
  resources :invitations
  mount Pwa::Engine, at: ''

  constraints subdomain: '' do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    resources :games, path: 'app', except: [:edit] do
      resources :invitations, only: [:show, :new, :create]
      resources :participants, except: [:edit, :update] do
        resources :tips, except: [:show, :new, :edit]
        resources :tips, only: [:new, :edit], constraints: Modalist::Ajax.new
      end
      resources :matches, only: [:index, :show]
      resources :nations, only: [:show]
    end
    root to: 'welcome#index'
  end

  match '*path', to: 'r404#not_found', via: :all
end

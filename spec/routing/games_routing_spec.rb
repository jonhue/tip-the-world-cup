require 'rails_helper'

RSpec.describe GamesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/app').to route_to('games#index', subdomain: '')
    end
      it 'routes to #new' do
        expect(get: '/app/games/new').to route_to('games#new', subdomain: '')
      end
    it 'routes to #show' do
      expect(get: '/app/games/1').to route_to('games#show', id: '1', subdomain: '')
    end
    it 'routes to #create' do
      expect(post: '/app/games').to route_to('games#create', subdomain: '')
    end
    it 'routes to #update' do
      expect(put: '/app/games/1').to route_to('games#update', id: '1', subdomain: '')
    end
    it 'routes to #destroy' do
      expect(delete: '/app/games/1').to route_to('games#destroy', id: '1', subdomain: '')
    end
  end
end

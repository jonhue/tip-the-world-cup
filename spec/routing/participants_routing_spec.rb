require 'rails_helper'

RSpec.describe ParticipantsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/app/games/1/participants').to route_to('participants#index', game_id: '1', subdomain: '')
    end
    it 'routes to #new' do
      expect(get: '/app/games/1/participants/new').to route_to('participants#new', game_id: '1', subdomain: '')
    end
    it 'routes to #show' do
      expect(get: '/app/games/1/participants/1').to route_to('participants#show', id: '1', game_id: '1', subdomain: '')
    end
    it 'routes to #create' do
      expect(post: '/app/games/1/participants').to route_to('participants#create', game_id: '1', subdomain: '')
    end
    it 'routes to #destroy' do
      expect(delete: '/app/games/1/participants/1').to route_to('participants#destroy', id: '1', game_id: '1', subdomain: '')
    end
  end
end

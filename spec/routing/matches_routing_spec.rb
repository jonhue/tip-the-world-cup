require 'rails_helper'

RSpec.describe MatchesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/app/games/1/matches').to route_to('matches#index', game_id: '1', subdomain: '')
    end
    it 'routes to #show' do
      expect(get: '/app/games/1/matches/1').to route_to('matches#show', id: '1', game_id: '1', subdomain: '')
    end
  end
end

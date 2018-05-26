require 'rails_helper'

RSpec.describe NationsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/app/games/1/nations/germany').to route_to('nations#show', id: 'germany', game_id: '1', subdomain: '')
    end
  end
end

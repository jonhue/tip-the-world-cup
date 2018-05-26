require 'rails_helper'

RSpec.describe TipsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/app/games/1/participants/1/tips/new').to route_to('tips#new', game_id: '1', participant_id: '1', subdomain: '')
    end
    it 'routes to #edit' do
      expect(get: '/app/games/1/participants/1/tips/1/edit').to route_to('tips#edit', id: '1', game_id: '1', participant_id: '1', subdomain: '')
    end
  end
end

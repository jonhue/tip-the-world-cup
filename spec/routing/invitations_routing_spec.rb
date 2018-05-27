require 'rails_helper'

RSpec.describe InvitationsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/app/1/invitations/new').to route_to('invitations#new', game_id: '1', subdomain: '')
    end
    it 'routes to #show' do
      expect(get: '/app/1/invitations/1').to route_to('invitations#show', id: '1', game_id: '1', subdomain: '')
    end
    it 'routes to #create' do
      expect(post: '/app/1/invitations').to route_to('invitations#create', game_id: '1', subdomain: '')
    end
  end
end

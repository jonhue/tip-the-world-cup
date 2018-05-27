require 'rails_helper'

RSpec.describe TipsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/app/1/participants/1/tips').to route_to('tips#index', game_id: '1', participant_id: '1', subdomain: '')
    end
    # it 'routes to #new' do
    #   expect(get: '/app/1/participants/1/tips/new').to route_to('tips#new', game_id: '1', participant_id: '1', subdomain: '')
    # end
    # it 'routes to #edit' do
    #   expect(get: '/app/1/participants/1/tips/1/edit').to route_to('tips#edit', id: '1', game_id: '1', participant_id: '1', subdomain: '')
    # end
    it 'routes to #create' do
      expect(post: '/app/1/participants/1/tips').to route_to('tips#create', game_id: '1', participant_id: '1', subdomain: '')
    end
    it 'routes to #update' do
      expect(put: '/app/1/participants/1/tips/1').to route_to('tips#update', id: '1', game_id: '1', participant_id: '1', subdomain: '')
    end
    it 'routes to #destroy' do
      expect(delete: '/app/1/participants/1/tips/1').to route_to('tips#destroy', id: '1', game_id: '1', participant_id: '1', subdomain: '')
    end
  end
end

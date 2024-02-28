require 'rails_helper'

RSpec.describe ConvertersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/converters').to route_to('converters#index')
    end

    it 'routes to #new' do
      expect(get: '/converters/new').to route_to('converters#new')
    end

    it 'routes to #show' do
      expect(get: '/converters/1').to route_to('converters#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/converters/1/edit').to route_to('converters#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/converters').to route_to('converters#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/converters/1').to route_to('converters#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/converters/1').to route_to('converters#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/converters/1').to route_to('converters#destroy', id: '1')
    end
  end
end

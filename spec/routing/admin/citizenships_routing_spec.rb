require 'rails_helper'

RSpec.describe Admin::CitizenshipsController, type: :routing do

  it { expect(get: '/admin/citizenships').to route_to(controller: 'admin/citizenships', action: 'index') }
  it { expect(get: '/admin/citizenships/new').to route_to(controller: 'admin/citizenships', action: 'new') }
  it { expect(get: '/admin/citizenships/1').to route_to(controller: 'admin/citizenships', action: 'show', id: '1') }
  it { expect(get: '/admin/citizenships/1/edit').to route_to(controller: 'admin/citizenships', action: 'edit', id: '1') }
  it { expect(post: '/admin/citizenships').to route_to(controller: 'admin/citizenships', action: 'create') }
  it { expect(patch: '/admin/citizenships/1').to route_to(controller: 'admin/citizenships', action: 'update', id: '1') }
  it { expect(delete: '/admin/citizenships/1').to route_to(controller: 'admin/citizenships', action: 'destroy', id: '1') }

end

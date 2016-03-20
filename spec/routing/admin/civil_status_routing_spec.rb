require 'rails_helper'

RSpec.describe Admin::CivilStatusesController, type: :routing do

  it { expect(get: '/admin/civil_statuses').to route_to(controller: 'admin/civil_statuses', action: 'index') }
  it { expect(get: '/admin/civil_statuses/new').to route_to(controller: 'admin/civil_statuses', action: 'new') }
  it { expect(get: '/admin/civil_statuses/1').to route_to(controller: 'admin/civil_statuses', action: 'show', id: '1') }
  it { expect(get: '/admin/civil_statuses/1/edit').to route_to(controller: 'admin/civil_statuses', action: 'edit', id: '1') }
  it { expect(post: '/admin/civil_statuses').to route_to(controller: 'admin/civil_statuses', action: 'create') }
  it { expect(patch: '/admin/civil_statuses/1').to route_to(controller: 'admin/civil_statuses', action: 'update', id: '1') }
  it { expect(delete: '/admin/civil_statuses/1').to route_to(controller: 'admin/civil_statuses', action: 'destroy', id: '1') }

end

require 'rails_helper'

RSpec.describe Admin::ReligionsController, type: :routing do

  it { expect(get: '/admin/religions').to route_to(controller: 'admin/religions', action: 'index') }
  it { expect(get: '/admin/religions/new').to route_to(controller: 'admin/religions', action: 'new') }
  it { expect(get: '/admin/religions/1').to route_to(controller: 'admin/religions', action: 'show', id: '1') }
  it { expect(get: '/admin/religions/1/edit').to route_to(controller: 'admin/religions', action: 'edit', id: '1') }
  it { expect(post: '/admin/religions').to route_to(controller: 'admin/religions', action: 'create') }
  it { expect(patch: '/admin/religions/1').to route_to(controller: 'admin/religions', action: 'update', id: '1') }
  it { expect(delete: '/admin/religions/1').to route_to(controller: 'admin/religions', action: 'destroy', id: '1') }

end

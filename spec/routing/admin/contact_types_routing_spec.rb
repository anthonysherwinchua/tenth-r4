require 'rails_helper'

RSpec.describe Admin::ContactTypesController, type: :routing do

  it { expect(get: '/admin/contact_types').to route_to(controller: 'admin/contact_types', action: 'index') }
  it { expect(get: '/admin/contact_types/new').to route_to(controller: 'admin/contact_types', action: 'new') }
  it { expect(get: '/admin/contact_types/1').to route_to(controller: 'admin/contact_types', action: 'show', id: '1') }
  it { expect(get: '/admin/contact_types/1/edit').to route_to(controller: 'admin/contact_types', action: 'edit', id: '1') }
  it { expect(post: '/admin/contact_types').to route_to(controller: 'admin/contact_types', action: 'create') }
  it { expect(patch: '/admin/contact_types/1').to route_to(controller: 'admin/contact_types', action: 'update', id: '1') }
  it { expect(delete: '/admin/contact_types/1').to route_to(controller: 'admin/contact_types', action: 'destroy', id: '1') }

end

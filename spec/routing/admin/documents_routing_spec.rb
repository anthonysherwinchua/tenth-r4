require 'rails_helper'

RSpec.describe Admin::DocumentsController, type: :routing do

  it { expect(get: '/admin/documents').to route_to(controller: 'admin/documents', action: 'index') }
  it { expect(get: '/admin/documents/new').to route_to(controller: 'admin/documents', action: 'new') }
  it { expect(get: '/admin/documents/1').to route_to(controller: 'admin/documents', action: 'show', id: '1') }
  it { expect(get: '/admin/documents/1/edit').to route_to(controller: 'admin/documents', action: 'edit', id: '1') }
  it { expect(post: '/admin/documents').to route_to(controller: 'admin/documents', action: 'create') }
  it { expect(patch: '/admin/documents/1').to route_to(controller: 'admin/documents', action: 'update', id: '1') }
  it { expect(delete: '/admin/documents/1').to route_to(controller: 'admin/documents', action: 'destroy', id: '1') }

end

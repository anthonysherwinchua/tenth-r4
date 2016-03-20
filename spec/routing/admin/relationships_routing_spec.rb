require 'rails_helper'

RSpec.describe Admin::RelationshipsController, type: :routing do

  it { expect(get: '/admin/relationships').to route_to(controller: 'admin/relationships', action: 'index') }
  it { expect(get: '/admin/relationships/new').to route_to(controller: 'admin/relationships', action: 'new') }
  it { expect(get: '/admin/relationships/1').to route_to(controller: 'admin/relationships', action: 'show', id: '1') }
  it { expect(get: '/admin/relationships/1/edit').to route_to(controller: 'admin/relationships', action: 'edit', id: '1') }
  it { expect(post: '/admin/relationships').to route_to(controller: 'admin/relationships', action: 'create') }
  it { expect(patch: '/admin/relationships/1').to route_to(controller: 'admin/relationships', action: 'update', id: '1') }
  it { expect(delete: '/admin/relationships/1').to route_to(controller: 'admin/relationships', action: 'destroy', id: '1') }

end

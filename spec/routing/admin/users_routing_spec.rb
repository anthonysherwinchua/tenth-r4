require 'rails_helper'

RSpec.describe Admin::UsersController, type: :routing do

  it { expect(get: '/admin/users').to route_to(controller: 'admin/users', action: 'index') }
  it { expect(get: '/admin/users/new').to route_to(controller: 'admin/users', action: 'new') }
  it { expect(get: '/admin/users/1').to route_to(controller: 'admin/users', action: 'show', id: '1') }
  it { expect(get: '/admin/users/1/edit').to route_to(controller: 'admin/users', action: 'edit', id: '1') }
  it { expect(post: '/admin/users').to route_to(controller: 'admin/users', action: 'create') }
  it { expect(patch: '/admin/users/1').to route_to(controller: 'admin/users', action: 'update', id: '1') }
  it { expect(delete: '/admin/users/1').to route_to(controller: 'admin/users', action: 'destroy', id: '1') }

end

require 'rails_helper'

RSpec.describe Admin::ZodiacsController, type: :routing do

  it { expect(get: '/admin/zodiacs').to route_to(controller: 'admin/zodiacs', action: 'index') }
  it { expect(get: '/admin/zodiacs/new').to route_to(controller: 'admin/zodiacs', action: 'new') }
  it { expect(get: '/admin/zodiacs/1').to route_to(controller: 'admin/zodiacs', action: 'show', id: '1') }
  it { expect(get: '/admin/zodiacs/1/edit').to route_to(controller: 'admin/zodiacs', action: 'edit', id: '1') }
  it { expect(post: '/admin/zodiacs').to route_to(controller: 'admin/zodiacs', action: 'create') }
  it { expect(patch: '/admin/zodiacs/1').to route_to(controller: 'admin/zodiacs', action: 'update', id: '1') }
  it { expect(delete: '/admin/zodiacs/1').to route_to(controller: 'admin/zodiacs', action: 'destroy', id: '1') }

end

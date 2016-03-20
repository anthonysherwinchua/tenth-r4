require 'rails_helper'

RSpec.describe Admin::BloodTypesController, type: :routing do

  it { expect(get: '/admin/blood_types').to route_to(controller: 'admin/blood_types', action: 'index') }
  it { expect(get: '/admin/blood_types/new').to route_to(controller: 'admin/blood_types', action: 'new') }
  it { expect(get: '/admin/blood_types/1').to route_to(controller: 'admin/blood_types', action: 'show', id: '1') }
  it { expect(get: '/admin/blood_types/1/edit').to route_to(controller: 'admin/blood_types', action: 'edit', id: '1') }
  it { expect(post: '/admin/blood_types').to route_to(controller: 'admin/blood_types', action: 'create') }
  it { expect(patch: '/admin/blood_types/1').to route_to(controller: 'admin/blood_types', action: 'update', id: '1') }
  it { expect(delete: '/admin/blood_types/1').to route_to(controller: 'admin/blood_types', action: 'destroy', id: '1') }

end

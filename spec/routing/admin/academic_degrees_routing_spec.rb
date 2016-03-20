require 'rails_helper'

RSpec.describe Admin::AcademicDegreesController, type: :routing do

  it { expect(get: '/admin/academic_degrees').to route_to(controller: 'admin/academic_degrees', action: 'index') }
  it { expect(get: '/admin/academic_degrees/new').to route_to(controller: 'admin/academic_degrees', action: 'new') }
  it { expect(get: '/admin/academic_degrees/1').to route_to(controller: 'admin/academic_degrees', action: 'show', id: '1') }
  it { expect(get: '/admin/academic_degrees/1/edit').to route_to(controller: 'admin/academic_degrees', action: 'edit', id: '1') }
  it { expect(post: '/admin/academic_degrees').to route_to(controller: 'admin/academic_degrees', action: 'create') }
  it { expect(patch: '/admin/academic_degrees/1').to route_to(controller: 'admin/academic_degrees', action: 'update', id: '1') }
  it { expect(delete: '/admin/academic_degrees/1').to route_to(controller: 'admin/academic_degrees', action: 'destroy', id: '1') }

end

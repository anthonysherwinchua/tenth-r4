require 'rails_helper'

RSpec.describe Admin::AcademicLevelsController, type: :routing do

  it { expect(get: '/admin/academic_levels').to route_to(controller: 'admin/academic_levels', action: 'index') }
  it { expect(get: '/admin/academic_levels/new').to route_to(controller: 'admin/academic_levels', action: 'new') }
  it { expect(get: '/admin/academic_levels/1').to route_to(controller: 'admin/academic_levels', action: 'show', id: '1') }
  it { expect(get: '/admin/academic_levels/1/edit').to route_to(controller: 'admin/academic_levels', action: 'edit', id: '1') }
  it { expect(post: '/admin/academic_levels').to route_to(controller: 'admin/academic_levels', action: 'create') }
  it { expect(patch: '/admin/academic_levels/1').to route_to(controller: 'admin/academic_levels', action: 'update', id: '1') }
  it { expect(delete: '/admin/academic_levels/1').to route_to(controller: 'admin/academic_levels', action: 'destroy', id: '1') }

end

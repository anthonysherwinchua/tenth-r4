require 'rails_helper'

RSpec.describe Admin::AcademicDegreesController, type: :routing do

  it { expect(get: '/admin/academic_levels/9/academic_degrees').to route_to(controller: 'admin/academic_degrees', action: 'index', academic_level_id: '9') }
  it { expect(get: '/admin/academic_levels/9/academic_degrees/new').to route_to(controller: 'admin/academic_degrees', action: 'new', academic_level_id: '9') }
  it { expect(get: '/admin/academic_levels/9/academic_degrees/1').to route_to(controller: 'admin/academic_degrees', action: 'show', id: '1', academic_level_id: '9') }
  it { expect(get: '/admin/academic_levels/9/academic_degrees/1/edit').to route_to(controller: 'admin/academic_degrees', action: 'edit', id: '1', academic_level_id: '9') }
  it { expect(post: '/admin/academic_levels/9/academic_degrees').to route_to(controller: 'admin/academic_degrees', action: 'create', academic_level_id: '9') }
  it { expect(patch: '/admin/academic_levels/9/academic_degrees/1').to route_to(controller: 'admin/academic_degrees', action: 'update', id: '1', academic_level_id: '9') }
  it { expect(delete: '/admin/academic_levels/9/academic_degrees/1').to route_to(controller: 'admin/academic_degrees', action: 'destroy', id: '1', academic_level_id: '9') }

end

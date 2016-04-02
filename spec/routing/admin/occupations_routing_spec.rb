require 'rails_helper'

RSpec.describe Admin::OccupationsController, type: :routing do

  it { expect(get: '/admin/occupations').to route_to(controller: 'admin/occupations', action: 'index') }
  it { expect(get: '/admin/occupations/new').to route_to(controller: 'admin/occupations', action: 'new') }
  it { expect(get: '/admin/occupations/1').to route_to(controller: 'admin/occupations', action: 'show', id: '1') }
  it { expect(get: '/admin/occupations/1/edit').to route_to(controller: 'admin/occupations', action: 'edit', id: '1') }
  it { expect(post: '/admin/occupations').to route_to(controller: 'admin/occupations', action: 'create') }
  it { expect(patch: '/admin/occupations/1').to route_to(controller: 'admin/occupations', action: 'update', id: '1') }
  it { expect(delete: '/admin/occupations/1').to route_to(controller: 'admin/occupations', action: 'destroy', id: '1') }

end

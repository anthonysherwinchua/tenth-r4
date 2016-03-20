require 'rails_helper'

RSpec.describe Admin::SkillsController, type: :routing do

  it { expect(get: '/admin/skills').to route_to(controller: 'admin/skills', action: 'index') }
  it { expect(get: '/admin/skills/new').to route_to(controller: 'admin/skills', action: 'new') }
  it { expect(get: '/admin/skills/1').to route_to(controller: 'admin/skills', action: 'show', id: '1') }
  it { expect(get: '/admin/skills/1/edit').to route_to(controller: 'admin/skills', action: 'edit', id: '1') }
  it { expect(post: '/admin/skills').to route_to(controller: 'admin/skills', action: 'create') }
  it { expect(patch: '/admin/skills/1').to route_to(controller: 'admin/skills', action: 'update', id: '1') }
  it { expect(delete: '/admin/skills/1').to route_to(controller: 'admin/skills', action: 'destroy', id: '1') }

end

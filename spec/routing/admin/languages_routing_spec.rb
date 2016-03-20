require 'rails_helper'

RSpec.describe Admin::LanguagesController, type: :routing do

  it { expect(get: '/admin/languages').to route_to(controller: 'admin/languages', action: 'index') }
  it { expect(get: '/admin/languages/new').to route_to(controller: 'admin/languages', action: 'new') }
  it { expect(get: '/admin/languages/1').to route_to(controller: 'admin/languages', action: 'show', id: '1') }
  it { expect(get: '/admin/languages/1/edit').to route_to(controller: 'admin/languages', action: 'edit', id: '1') }
  it { expect(post: '/admin/languages').to route_to(controller: 'admin/languages', action: 'create') }
  it { expect(patch: '/admin/languages/1').to route_to(controller: 'admin/languages', action: 'update', id: '1') }
  it { expect(delete: '/admin/languages/1').to route_to(controller: 'admin/languages', action: 'destroy', id: '1') }

end

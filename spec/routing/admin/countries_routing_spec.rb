require 'rails_helper'

RSpec.describe Admin::CountriesController, type: :routing do

  it { expect(get: '/admin/countries').to route_to(controller: 'admin/countries', action: 'index') }
  it { expect(get: '/admin/countries/new').to route_to(controller: 'admin/countries', action: 'new') }
  it { expect(get: '/admin/countries/1').to route_to(controller: 'admin/countries', action: 'show', id: '1') }
  it { expect(get: '/admin/countries/1/edit').to route_to(controller: 'admin/countries', action: 'edit', id: '1') }
  it { expect(post: '/admin/countries').to route_to(controller: 'admin/countries', action: 'create') }
  it { expect(patch: '/admin/countries/1').to route_to(controller: 'admin/countries', action: 'update', id: '1') }
  it { expect(delete: '/admin/countries/1').to route_to(controller: 'admin/countries', action: 'destroy', id: '1') }

end

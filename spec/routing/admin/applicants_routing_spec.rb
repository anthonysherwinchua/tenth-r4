require 'rails_helper'

RSpec.describe Admin::ApplicantsController, type: :routing do

  it { expect(get: '/admin/applicants').to route_to(controller: 'admin/applicants', action: 'index') }
  it { expect(get: '/admin/applicants/new').to route_to(controller: 'admin/applicants', action: 'new') }
  it { expect(get: '/admin/applicants/1').to route_to(controller: 'admin/applicants', action: 'show', id: '1') }
  it { expect(get: '/admin/applicants/1/edit').to route_to(controller: 'admin/applicants', action: 'edit', id: '1') }
  it { expect(post: '/admin/applicants').to route_to(controller: 'admin/applicants', action: 'create') }
  it { expect(patch: '/admin/applicants/1').to route_to(controller: 'admin/applicants', action: 'update', id: '1') }

end

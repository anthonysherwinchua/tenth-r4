require 'rails_helper'

RSpec.describe Admin::JobOpeningsController, type: :routing do

  it { expect(get: '/admin/job_openings').to route_to(controller: 'admin/job_openings', action: 'index') }
  it { expect(get: '/admin/job_openings/new').to route_to(controller: 'admin/job_openings', action: 'new') }
  it { expect(get: '/admin/job_openings/1').to route_to(controller: 'admin/job_openings', action: 'show', id: '1') }
  it { expect(get: '/admin/job_openings/1/edit').to route_to(controller: 'admin/job_openings', action: 'edit', id: '1') }
  it { expect(post: '/admin/job_openings').to route_to(controller: 'admin/job_openings', action: 'create') }
  it { expect(patch: '/admin/job_openings/1').to route_to(controller: 'admin/job_openings', action: 'update', id: '1') }
  it { expect(delete: '/admin/job_openings/1').to route_to(controller: 'admin/job_openings', action: 'destroy', id: '1') }

end

require 'rails_helper'

RSpec.describe Admin::RequirementsController, type: :routing do

  it { expect(get: '/admin/job_openings/9/requirements').to route_to(controller: 'admin/requirements', action: 'index', job_opening_id: '9') }
  it { expect(get: '/admin/job_openings/9/requirements/new').to route_to(controller: 'admin/requirements', action: 'new', job_opening_id: '9') }
  it { expect(get: '/admin/job_openings/9/requirements/1').to route_to(controller: 'admin/requirements', action: 'show', id: '1', job_opening_id: '9') }
  it { expect(get: '/admin/job_openings/9/requirements/1/edit').to route_to(controller: 'admin/requirements', action: 'edit', id: '1', job_opening_id: '9') }
  it { expect(post: '/admin/job_openings/9/requirements').to route_to(controller: 'admin/requirements', action: 'create', job_opening_id: '9') }
  it { expect(patch: '/admin/job_openings/9/requirements/1').to route_to(controller: 'admin/requirements', action: 'update', id: '1', job_opening_id: '9') }
  it { expect(delete: '/admin/job_openings/9/requirements/1').to route_to(controller: 'admin/requirements', action: 'destroy', id: '1', job_opening_id: '9') }

end

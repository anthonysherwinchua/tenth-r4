require 'rails_helper'

RSpec.describe Admin::BaseController, type: :routing do

  it { expect(get: '/admin').to route_to(controller: 'admin/base', action: 'dashboard') }
  it { expect(get: '/admin/dashboard').to route_to(controller: 'admin/base', action: 'dashboard') }

end

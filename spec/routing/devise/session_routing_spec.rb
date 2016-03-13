require 'rails_helper'

RSpec.describe ApplicationController, type: :routing do

  it { expect(get: '/login').to route_to(controller: 'devise/sessions', action: 'new') }
  it { expect(post: '/login').to route_to(controller: 'devise/sessions', action: 'create') }
  it { expect(delete: '/logout').to route_to(controller: 'devise/sessions', action: 'destroy') }

end

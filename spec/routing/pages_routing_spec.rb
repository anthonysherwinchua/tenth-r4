require 'rails_helper'

RSpec.describe PagesController, type: :routing do

  it { expect(get: '/about_us').to route_to(controller: 'pages', action: 'about_us') }
  it { expect(get: '/').to route_to(controller: 'pages', action: 'index') }

end

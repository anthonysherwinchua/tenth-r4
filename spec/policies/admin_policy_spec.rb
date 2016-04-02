require 'rails_helper'

RSpec.describe AdminPolicy, type: :policy do

  subject { described_class }

  let(:admin) { create(:user) }
  let(:encoder) { create(:user, :encoder) }

  permissions :access? do

    it { is_expected.to permit(admin, nil) }
    it { is_expected.not_to permit(encoder, nil) }

  end

end

require 'rails_helper'

RSpec.describe JobOpening, type: :model do

  it { is_expected.to belong_to(:country) }
  it { is_expected.to belong_to(:occupation) }

  it { is_expected.to validate_presence_of(:country) }
  it { is_expected.to validate_presence_of(:occupation) }
  it { is_expected.to validate_uniqueness_of(:occupation_id).scoped_to(:country_id).with_message('combination of country and occupation already exists') }

end

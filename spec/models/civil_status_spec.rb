require 'rails_helper'

RSpec.describe CivilStatus, type: :model do

  it { is_expected.to have_many(:applicants).inverse_of(:civil_status) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

end

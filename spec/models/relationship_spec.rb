require 'rails_helper'

RSpec.describe Relationship, type: :model do

  it { is_expected.to have_many(:applicant_family_members).inverse_of(:relationship) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

end

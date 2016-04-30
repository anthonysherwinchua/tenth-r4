require 'rails_helper'

RSpec.describe Applicant, type: :model do

  it { is_expected.to belong_to(:religion).inverse_of(:applicants) }
  it { is_expected.to belong_to(:civil_status).inverse_of(:applicants) }
  it { is_expected.to have_one(:applicant_family_detail).dependent(:destroy) }
  it { is_expected.to have_many(:applicant_family_members).inverse_of(:applicant).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:birthday) }
  it { is_expected.to validate_presence_of(:gender) }
  it { is_expected.to validate_presence_of(:religion) }
  it { is_expected.to validate_presence_of(:civil_status) }

end

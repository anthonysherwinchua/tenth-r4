require 'rails_helper'

RSpec.describe ApplicantFamilyDetail, type: :model do

  it { is_expected.to belong_to(:applicant) }

  it { is_expected.to validate_presence_of(:no_in_fam) }
  it { is_expected.to validate_presence_of(:applicant) }

  it { is_expected.to validate_uniqueness_of(:applicant_id) }

end


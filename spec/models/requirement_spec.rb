require 'rails_helper'

RSpec.describe Requirement, type: :model do

  it { is_expected.to belong_to(:job_opening) }
  it { is_expected.to belong_to(:document) }

  it { is_expected.to validate_presence_of(:job_opening) }
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_uniqueness_of(:document_id).scoped_to(:job_opening_id).with_message('combination of job opening and document already exists') }
end

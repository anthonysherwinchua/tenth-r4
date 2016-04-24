require 'rails_helper'

RSpec.describe WizardForm::Errors::NotIntegerError, type: :custom_standard_error do

  subject { described_class }

  it { expect { raise subject }.to raise_error('Total steps must be an integer (whole numbers)!') }

end

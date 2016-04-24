require 'rails_helper'

RSpec.describe WizardForm::Errors::NotPermittedError, type: :custom_standard_error do

  subject { described_class }

  it { expect { raise subject }.to raise_error('Step is not permitted!') }

end

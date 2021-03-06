class ApplicantWizardForm::Steps::PhotoStep < WizardForm::Step

  attr_accessor :first_name, :last_name

  validates :first_name, :last_name, presence: true

  def initialize(applicant)
    @applicant = applicant
  end
end

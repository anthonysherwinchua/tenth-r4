class ApplicantWizardForm::Steps::ApplicationStep < WizardForm::Step

  attr_accessor :first_name, :last_name

  validates :first_name, :last_name, presence: true

end

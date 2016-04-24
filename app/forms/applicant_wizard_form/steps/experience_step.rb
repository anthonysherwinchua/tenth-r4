class ApplicantWizardForm::Steps::ExperienceStep < WizardForm::Step

  ATTRIBUTES = [:first_name, :last_name]

  attr_accessor *ATTRIBUTES

  validates :first_name, :last_name, presence: true

end

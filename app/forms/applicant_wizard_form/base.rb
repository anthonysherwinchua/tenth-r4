class ApplicantWizardForm::Base
  include WizardForm::Base

 STEPS = [
   ApplicantWizardForm::Steps::PersonalInfoStep,
   ApplicantWizardForm::Steps::EducationStep,
   ApplicantWizardForm::Steps::EmploymentStep,
   ApplicantWizardForm::Steps::SkillAndRatingStep,
   ApplicantWizardForm::Steps::PhotoStep,
   ApplicantWizardForm::Steps::ApplicationStep
 ]

  def steps
    STEPS
  end

end

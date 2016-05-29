class ApplicantWizardForm::Base
  include WizardForm::Base

 STEPS = [
   ApplicantWizardForm::Steps::PersonalInfoStep,
   ApplicantWizardForm::Steps::EducationStep,
   ApplicantWizardForm::Steps::ExperienceStep,
   ApplicantWizardForm::Steps::SkillAndRatingStep,
   ApplicantWizardForm::Steps::PhotoStep,
   ApplicantWizardForm::Steps::ApplicationStep
 ]

  attr_reader :applicant

  def initialize(applicant, step=1)
    @applicant = applicant
  end

  def steps
    STEPS
  end

end

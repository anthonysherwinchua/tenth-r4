class ApplicantWizardForm::Steps::EducationStep < WizardForm::Step

  main_model :applicant, Applicant

  validate :atleast_one_education

  has_one :primary_education, ApplicantEducation

  def initialize(applicant)
    @applicant = applicant
    @primary_education = @applicant.applicant_educations.first_or_initialize
  end

  def save(params)
    if valid?
      education_params = params[:primary_education]
      ApplicantEducation.transaction do
        @primary_education.update_attributes!(education_params)
      end
      true
    else
      false
    end
  rescue ActiveRecord::RecordInvalid => e
    false
  end

  private

  def atleast_one_education
    errors.add(:base, 'Applicant must have at least one education') if @applicant.applicant_educations.count.zero?
  end

end

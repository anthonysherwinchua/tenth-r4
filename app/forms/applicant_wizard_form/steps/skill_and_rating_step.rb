class ApplicantWizardForm::Steps::SkillAndRatingStep < BaseForm

  main_model :applicant, Applicant

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new

    super(params)
  end

  def validate_and_clear_errors
    valid = valid?

    valid
  end

  def valid?
    true
  end
end

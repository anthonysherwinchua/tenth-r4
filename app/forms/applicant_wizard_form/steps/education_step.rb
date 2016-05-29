class ApplicantWizardForm::Steps::EducationStep < BaseForm

  main_model :applicant, Applicant

  has_many :applicant_educations, ApplicantEducation

  validate :atleast_one_education

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new

    super(params)

    @applicant.applicant_educations.build if @applicant.applicant_educations.size.zero?
    @applicant_educations = @applicant.applicant_educations
  end

  def save(params)
    super(params)

    ApplicantEducation.transaction do
      @applicant_educations.map(&:save!)
    end
  rescue ActiveRecord::RecordInvalid => e
    @applicant_educations.map(&:valid?)
    puts "Error (Edu): #{e.inspect}"
  end

  private

  def atleast_one_education
    errors.add(:base, :invalid) if @applicant_educations&.size.to_i == 0
  end

end

class ApplicantWizardForm::Steps::EmploymentStep < BaseForm

  main_model :applicant, Applicant

  has_many :applicant_employments, ApplicantEmployment

  validate :atleast_one_employment

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new

    super(params)

    @applicant.applicant_employments.build if @applicant.applicant_employments.size.zero?
    @applicant_employments = @applicant.applicant_employments
  end

  def save(params)
    super(params)

    ApplicantEducation.transaction do
      @applicant_employments.map(&:save!)
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    @applicant_employments.map(&:valid?)
    errors.add(:base, e)
    puts "Error (Emp): #{e.inspect}"
    false
  end

  def validate_and_clear_errors
    valid = valid?
    @applicant_employments.map{|e| e.errors.clear }
    @applicant.applicant_employments = @applicant.applicant_employments.select{|v| v.persisted? }
    valid
  end

  def valid?
    !(@applicant_employments.map(&:valid?).include? false)
  end

  private

  def atleast_one_employment
    errors.add(:base, :invalid) if @applicant_employments&.size.to_i == 0
  end

end

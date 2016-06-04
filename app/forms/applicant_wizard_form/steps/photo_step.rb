class ApplicantWizardForm::Steps::PhotoStep < BaseForm

  main_model :applicant, Applicant

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new

    super(params)
  end

  def save(params)
    super(params)

    Applicant.transaction do
      @applicant.save!
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    valid?
    puts "Error: #{e.inspect}"
    false
  end

  def validate_and_clear_errors
    valid = valid?
    @applicant.errors.clear
    valid
  end

  def valid?
    @applicant.valid?
  end
end

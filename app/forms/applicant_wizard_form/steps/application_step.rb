class ApplicantWizardForm::Steps::ApplicationStep < BaseForm

  main_model :applicant, Applicant

  has_many :applications, Application

  validate :atleast_one_application

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new

    super(params)

    @applicant.applications.build if @applicant.applications.size.zero?
    @applications = @applicant.applications
  end

  def save(params)
    super(params)

    Application.transaction do
      @applications.map(&:save!)
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    @applications.map(&:valid?)
    errors.add(:base, e)
    puts "Error (Edu): #{e.inspect}"
    false
  end

  def validate_and_clear_errors
    valid = valid?
    @applications.map{|e| e.errors.clear }
    @applicant.applications = @applicant.applications.select{|v| v.persisted? }
    valid
  end

  def valid?
    !(@applications.map(&:valid?).include? false)
  end

  private

  def atleast_one_application
    errors.add(:base, :invalid) if @applications&.size.to_i == 0
  end

end

require 'ostruct'

class ApplicantWizardForm::Steps::PersonalInfoStep < BaseForm

  attr_accessor :applicant, :applicant_contact_details

  def initialize(params)
    @applicant = params[:applicant].is_a?(Applicant) ? params[:applicant] : Applicant.new(params.delete(:applicant))
    @applicant.applicant_contact_details.build if @applicant.applicant_contact_details.count.zero?
    @applicant_contact_details = @applicant.applicant_contact_details
    super(params)
  end

  def applicant_attributes=(params)
    if @applicant.persisted?
      @applicant.attributes = params
    else
      @applicant = Applicant.new(params)
    end
  end

  ## HAS MANY (with cocoon) ##
  association :applicant_contact_details, ApplicantContactDetail

  def build_applicant_contact_details
    @applicant.applicant_contact_details.build
  end

  def applicant_contact_details_attributes=(params)
    params.each do |i, param|
      @applicant.applicant_contact_details.find_or_initialize_by(id: param[:id]).attributes = param
    end
    @applicant_contact_details = @applicant.applicant_contact_details
  end

  def save
    # Applicant.transaction do
    @applicant.applicant_contact_details = []
    @applicant.save
    # end
    # true
  # rescue ActiveRecord::RecordInvalid => e
  #   false
  end

end

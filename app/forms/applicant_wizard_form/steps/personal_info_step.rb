class ApplicantWizardForm::Steps::PersonalInfoStep < BaseForm

  main_model :applicant, Applicant

  has_one :applicant_family_detail, ApplicantFamilyDetail
  has_one :father, ApplicantFamilyMember
  has_one :mother, ApplicantFamilyMember
  has_one :spouse, ApplicantFamilyMember

  has_many :applicant_contact_details, ApplicantContactDetail

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new
    @applicant_family_detail = @applicant.applicant_family_detail || @applicant.build_applicant_family_detail

    relationship = Relationship.find_by(name: 'Father')
    @father = @applicant.applicant_family_members.where(relationship_id: relationship.id).first_or_initialize
    relationship = Relationship.find_by(name: 'Mother')
    @mother = @applicant.applicant_family_members.where(relationship_id: relationship.id).first_or_initialize
    relationship = Relationship.find_by(name: 'Spouse')
    @spouse = @applicant.applicant_family_members.where(relationship_id: relationship.id).first_or_initialize

    super(params)

    @applicant.applicant_contact_details.build if @applicant.applicant_contact_details.size.zero?
    @applicant_contact_details = @applicant.applicant_contact_details
  end

  def save
    Applicant.transaction do
      @applicant.save!
      @applicant_family_detail.save!
      @applicant_contact_details.map(&:save!)
    end
  rescue ActiveRecord::RecordInvalid => e
    @applicant_family_detail.valid?
    @applicant_contact_details.map(&:valid?)
    puts "Error: #{e.inspect}"
  end

end

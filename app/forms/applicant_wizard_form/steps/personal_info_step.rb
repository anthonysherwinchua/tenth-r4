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

    prepare_relationships %w(father mother spouse)

    super(params)

    @applicant.applicant_contact_details.build if @applicant.applicant_contact_details.size.zero?
    @applicant_contact_details = @applicant.applicant_contact_details
  end

  def save(params)
    super(params)

    Applicant.transaction do
      @applicant.save!
      @applicant_contact_details.map(&:save!)
      @applicant_family_detail.save!
      @father.save!
      @mother.save!
      @spouse.save!
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    @applicant_family_detail.valid?
    @applicant_contact_details.map(&:valid?)
    @father.valid?
    @mother.valid?
    @spouse.valid?
    puts "Error: #{e.inspect}"
  end

  private

  def prepare_relationships(names=[])
    names.each{|name| prepare_relationship name }
  end

  def prepare_relationship(name)
    relationship = Relationship.where(["lower(name) = ?", name]).first
    instance_variable_set("@#{name}",  @applicant.applicant_family_members.where(relationship_id: relationship.id).first_or_initialize)
  end

end

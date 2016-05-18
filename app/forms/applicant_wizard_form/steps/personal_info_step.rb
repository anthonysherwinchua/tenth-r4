class ApplicantWizardForm::Steps::PersonalInfoStep < WizardForm::Step

  main_model :applicant, Applicant

  has_many :applicant_contact_details, ApplicantContactDetail

  has_one :father, ApplicantFamilyMember
  has_one :mother, ApplicantFamilyMember
  has_one :spouse, ApplicantFamilyMember
  has_one :family_details, ApplicantFamilyDetail

  def initialize(applicant, params={})
    @applicant = applicant
    @applicant_contact_details = @applicant.applicant_contact_details || []
    if @applicant_contact_details.blank?
      @applicant_contact_details << @applicant.applicant_contact_details.build
      @applicant_contact_details << @applicant.applicant_contact_details.build
    end
    prepare_relationships(:father, :mother, :spouse)
    prepare_family_details
    super(params)
  end

  def save(params)
    Applicant.transaction do
      contact_details_attrs = params.delete 'applicant_contact_details_attributes'
      @applicant.applicant_contact_details.each_with_index do |acd, i|
        acd.attributes = contact_details_attrs["#{i}"]
      end

      @family_details.attributes = params.delete 'family_details'
      @father.attributes = params.delete 'father'
      @mother.attributes = params.delete 'mother'
      @spouse.attributes = params.delete 'spouse'
      @applicant.attributes = params
      @applicant.save!
      @family_details.update_attributes!(applicant: @applicant)
      @father.update_attributes!(applicant: @applicant)
      @mother.update_attributes!(applicant: @applicant)
      @spouse.update_attributes(applicant: @applicant)
    end
  rescue ActiveRecord::RecordInvalid => e
    @family_details.valid?
    @father.valid?
    @mother.valid?
    @spouse.valid? if spouse_required?
    false
  end

  private

  def prepare_relationships(*names)
    names.each{|name| prepare_relationship name}
  end

  def prepare_relationship(name)
    relationship = Relationship.where(["lower(name) = ?", name]).first
    if @applicant.persisted?
      family_member = @applicant.applicant_family_members.find_by(relationship_id: relationship.id)
    end

    unless family_member
      family_member = ApplicantFamilyMember.new(relationship_id: relationship.id)
    end
    instance_variable_set("@#{name}", family_member)
  end

  def spouse_required?
    ['n/a', 'single'].exclude? @applicant.civil_status.name.downcase
  end

  def prepare_family_details
    if @applicant.persisted?
      @family_details = @applicant.applicant_family_detail
    end

    unless @family_details
      @family_details = ApplicantFamilyDetail.new
    end
  end

end

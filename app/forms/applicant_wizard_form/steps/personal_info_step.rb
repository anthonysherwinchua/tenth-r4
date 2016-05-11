class ApplicantWizardForm::Steps::PersonalInfoStep < WizardForm::Step

  main_model :applicant, Applicant

  has_one :father, ApplicantFamilyMember
  has_one :mother, ApplicantFamilyMember
  has_one :spouse, ApplicantFamilyMember
  has_one :family_details, ApplicantFamilyDetail

  def initialize(applicant)
    @applicant = applicant
    prepare_relationships(:father, :mother, :spouse)
    prepare_family_details
  end

  def save(params)
    Applicant.transaction do
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
    true
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

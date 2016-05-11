class ApplicantWizardForm::Steps::PersonalInfoStep < WizardForm::Step

  main_model :applicant, Applicant

  has_one :father, ApplicantFamilyMember
  has_one :mother, ApplicantFamilyMember
  has_one :spouse, ApplicantFamilyMember

  def initialize(applicant)
    @applicant = applicant
    prepare_relationships(:father, :mother, :spouse)
  end

  def save(params)
    Applicant.transaction do
      @father.attributes = params.delete 'father'
      @mother.attributes = params.delete 'mother'
      @spouse.attributes = params.delete 'spouse'
      @applicant.attributes = params
      @applicant.save!
      @father.update_attributes!(applicant: @applicant)
      @mother.update_attributes!(applicant: @applicant)
      @spouse.update_attributes!(applicant: @applicant) if spouse_required?
    end
    true
  rescue ActiveRecord::RecordInvalid => e
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

end

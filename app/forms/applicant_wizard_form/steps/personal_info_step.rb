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
      @spouse.update_attributes!(applicant: @applicant)
    end
  rescue ActiveRecord::RecordInvalid => e
    @father.valid?
    @mother.valid?
    @spouse.valid?
    false
  end

  private

  def prepare_relationships(*names)
    names.each{|name| prepare_relationship name}
  end

  def prepare_relationship(name)
    relationship = Relationship.where(["lower(name) = ?", name]).first
    family_member = ApplicantFamilyMember.where(relationship_id: relationship.id)
                      .first_or_initialize
    instance_variable_set("@#{name}", family_member)
  end

end

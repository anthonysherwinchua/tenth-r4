class ApplicantWizardForm::Steps::SkillAndRatingStep < BaseForm

  main_model :applicant, Applicant

  has_many :applicant_languages, ApplicantLanguage
  has_many :applicant_skills, ApplicantSkill

  validate :atleast_one_language
  validate :atleast_one_skill

  def initialize(params={})
    @applicant = params[:applicant] || Applicant.new

    super(params)

    @applicant.applicant_languages.build if @applicant.applicant_languages.size.zero?
    @applicant_languages = @applicant.applicant_languages

    @applicant.applicant_skills.build if @applicant.applicant_skills.size.zero?
    @applicant_skills = @applicant.applicant_skills
  end

  def save(params)
    super(params)

    ApplicantEducation.transaction do
      @applicant_languages.map(&:save!)
      @applicant_skills.map(&:save!)
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    @applicant_skills.map(&:valid?)
    @applicant_languages.map(&:valid?)
    errors.add(:base, e)
    puts "Error (Edu): #{e.inspect}"
    false
  end

  def validate_and_clear_errors
    valid = valid?
    @applicant_languages.map{|e| e.errors.clear }
    @applicant.applicant_languages = @applicant.applicant_languages.select{|v| v.persisted? }
    @applicant_skills.map{|e| e.errors.clear }
    @applicant.applicant_skills = @applicant.applicant_skills.select{|v| v.persisted? }
    valid
  end

  def valid?
    !(@applicant_languages.map(&:valid?).include? false) &&
      !(@applicant_skills.map(&:valid?).include? false)
  end

  private

  def atleast_one_language
    errors.add(:base, :invalid) if @applicant_languages&.size.to_i == 0
  end

  def atleast_one_skill
    errors.add(:base, :invalid) if @applicant_skills&.size.to_i == 0
  end

end

class ApplicantWizardForm::Steps::EducationStep < WizardForm::Step

  NUMBER_OF_EDUCATIONS = 3

  main_model :applicant, Applicant

  has_one :education_1, ApplicantEducation
  has_one :education_2, ApplicantEducation
  has_one :education_3, ApplicantEducation

  validate :atleast_one_education

  def initialize(applicant)
    @applicant = applicant
    prepare_educations
  end

  def save(params)
    education_1_params = params[:education_1]
    education_2_params = params[:education_2]
    education_3_params = params[:education_3]
    ApplicantEducation.transaction do
      @education_1.update_attributes!(education_1_params)
      @education_2.update_attributes!(education_2_params) if has_any_value?(education_2_params)
      @education_3.update_attributes!(education_3_params) if has_any_value?(education_3_params)
    end
  rescue ActiveRecord::RecordInvalid => e
    false
  end

  private

  def has_any_value?(params)
    [:school, :from, :to].detect{|key| !params[key].blank? }
  end

  def prepare_educations
    (1..NUMBER_OF_EDUCATIONS).each do |i|
      prepare_education(i-1)
    end
  end

  def prepare_education(i)
    if @applicant.persisted?
      education = @applicant.applicant_educations[i]
    end

    unless education
      education = @applicant.applicant_educations.new
    end
    instance_variable_set("@education_#{i+1}", education)
  end

  def atleast_one_education
    @applicant.errors.add(:base, :invalid) if @applicant.applicant_educations.count == 0
  end

end

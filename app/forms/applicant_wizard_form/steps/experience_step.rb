class ApplicantWizardForm::Steps::ExperienceStep < WizardForm::Step

  NUMBER_OF_WORK_EXPERIENCES = 3

  main_model :applicant, Applicant

  has_one :work_experience_1, ApplicantEmployment
  has_one :work_experience_2, ApplicantEmployment
  has_one :work_experience_3, ApplicantEmployment

  def initialize(applicant)
    @applicant = applicant
    prepare_work_experiences()
  end

  def save(params)
    work_experience_1_params = params[:work_experience_1]
    work_experience_2_params = params[:work_experience_2]
    work_experience_3_params = params[:work_experience_3]
    ApplicantEmployment.transaction do
      @work_experience_1.update_attributes!(work_experience_1_params)
      @work_experience_2.update_attributes!(work_experience_2_params) if has_any_value?(work_experience_2_params)
      @work_experience_3.update_attributes!(work_experience_3_params) if has_any_value?(work_experience_3_params)
    end
  rescue ActiveRecord::RecordInvalid => e
    false
  end

  private

  def has_any_value?(params)
    [:occupation, :country, :employer, :years, :address, :contact, :salary].detect{|key| !params[key].blank? }
  end

  def prepare_work_experiences
    (1..NUMBER_OF_WORK_EXPERIENCES).each do |i|
      prepare_work_experience(i-1)
    end
  end

  def prepare_work_experience(i)
    if @applicant.persisted?
      work_experience = @applicant.applicant_employments[i]
    end

    unless work_experience
      work_experience = @applicant.applicant_employments.new
    end
    instance_variable_set("@work_experience_#{i+1}", work_experience)
  end

end

class ApplicantWizardForm::Steps::PersonalInfoStep < WizardForm::Step

  attr_accessor :first_name, :last_name, :middle_name, :suffix_name, :birthday, :birthplace, :gender, :height, :weight,
                :video_url, :religion, :civil_status

  validates :first_name, :last_name, presence: true

end

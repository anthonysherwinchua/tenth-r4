class ApplicantLanguage < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_educations
  belongs_to :language, inverse_of: :applicant_languages

  validates :language, presence: true
  validates :language_id, uniqueness: { scope: :applicant_id, message: 'combination of applicant and language already exists'}

end

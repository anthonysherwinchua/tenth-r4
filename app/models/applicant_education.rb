class ApplicantEducation < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_educations
  belongs_to :academic_level, inverse_of: :applicant_educations

  validates :school, :from, :to, presence: true
  validates :applicant, :academic_level, presence: true

end

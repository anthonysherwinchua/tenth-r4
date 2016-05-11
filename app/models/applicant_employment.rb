class ApplicantEmployment < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_educations
  belongs_to :academic_level, inverse_of: :applicant_employments

  validates :occupation, :country, :employer, :from, :to, :years, :address, :contact, :salary, presence: true
  validates :applicant, presence: true

end

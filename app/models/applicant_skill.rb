class ApplicantSkill < ActiveRecord::Base

  belongs_to :applicant, inverse_of: :applicant_educations
  belongs_to :skill, inverse_of: :applicant_skills

  validates :skill, presence: true
  validates :skill_id, uniqueness: { scope: :applicant_id, message: 'combination of applicant and skill already exists'}

end

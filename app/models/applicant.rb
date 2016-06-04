class Applicant < ActiveRecord::Base

  belongs_to :religion, inverse_of: :applicants
  belongs_to :civil_status, inverse_of: :applicants

  has_one :applicant_family_detail, inverse_of: :applicant, dependent: :destroy
  has_many :applicant_employments, inverse_of: :applicant, dependent: :destroy
  has_many :applicant_family_members, inverse_of: :applicant, dependent: :destroy
  has_many :applicant_educations, inverse_of: :applicant, dependent: :destroy
  has_many :applicant_languages, inverse_of: :applicant, dependent: :destroy
  has_many :applicant_skills, inverse_of: :applicant, dependent: :destroy
  has_many :applicant_contact_details, inverse_of: :applicant, dependent: :destroy

  validates :first_name, :last_name, :birthday, presence: true
  validates :religion, :civil_status, presence: true

end

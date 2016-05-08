class AcademicLevel < ActiveRecord::Base

  has_many :applicant_educations, inverse_of: :academic_level, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end

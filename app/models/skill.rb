class Skill < ActiveRecord::Base

  has_many :applicant_skills, inverse_of: :skill

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end

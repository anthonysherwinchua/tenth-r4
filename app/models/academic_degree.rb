class AcademicDegree < ActiveRecord::Base

  belongs_to :academic_level

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end

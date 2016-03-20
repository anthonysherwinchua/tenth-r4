class AcademicLevel < ActiveRecord::Base

  has_many :academic_degrees

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end

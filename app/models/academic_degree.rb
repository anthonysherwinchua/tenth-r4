class AcademicDegree < ActiveRecord::Base
  validates :degree, presence: true, uniqueness: true
end

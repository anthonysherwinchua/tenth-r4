class AddAcademicLevelIdToAcademicDegrees < ActiveRecord::Migration
  def change
    add_reference :academic_degrees, :academic_level, index: true, foreign_key: true
  end
end

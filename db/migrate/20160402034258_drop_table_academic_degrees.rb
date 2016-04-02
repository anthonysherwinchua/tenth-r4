class DropTableAcademicDegrees < ActiveRecord::Migration
  def change
    drop_table :academic_degrees
  end
end

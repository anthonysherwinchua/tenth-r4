class RemoveEnabledFromAcademicDegrees < ActiveRecord::Migration
  def change
    remove_column :academic_degrees, :enabled
  end
end

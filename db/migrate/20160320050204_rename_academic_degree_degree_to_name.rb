class RenameAcademicDegreeDegreeToName < ActiveRecord::Migration
  def change
    rename_column :academic_degrees, :degree, :name
  end
end

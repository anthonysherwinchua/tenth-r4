class AddMugShotToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :mug_shot, :string
  end
end

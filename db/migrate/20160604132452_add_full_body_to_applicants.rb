class AddFullBodyToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :full_body, :string
  end
end

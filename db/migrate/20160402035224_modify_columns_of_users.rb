class ModifyColumnsOfUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :middle_name
    add_column :users, :name, :string, null: false
  end
end

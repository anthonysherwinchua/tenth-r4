class DropTableSkinTypes < ActiveRecord::Migration
  def change
    drop_table :skin_types
  end
end

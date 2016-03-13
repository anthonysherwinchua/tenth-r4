class AddNamesToUsers < ActiveRecord::Migration
  def change

    change_table 'users' do |t|
      t.string   "username"
      t.string   "first_name",             :default => ""
      t.string   "last_name",              :default => ""
      t.string   "middle_name",            :default => ""
    end

  end
end

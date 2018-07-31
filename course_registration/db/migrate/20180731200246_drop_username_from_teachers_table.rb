class DropUsernameFromTeachersTable < ActiveRecord::Migration
  def change
    remove_column :teachers, :username 
  end
end

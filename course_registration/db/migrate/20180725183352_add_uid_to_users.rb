class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :teachers, :uid, :integer
  end
end

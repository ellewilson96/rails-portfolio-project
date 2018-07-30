class RemoveAttributesFromStudentsTable < ActiveRecord::Migration
  def change
    remove_column :students, :behavior
    remove_column :students, :favorite_subject
    remove_column :students, :gpa
  end
end

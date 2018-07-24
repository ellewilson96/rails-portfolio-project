class AddAttributesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gpa, :integer
    add_column :students, :behavior, :string
  end
end

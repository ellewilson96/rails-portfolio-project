class CreateCoursesTableAgain < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :number
    end
  end
end

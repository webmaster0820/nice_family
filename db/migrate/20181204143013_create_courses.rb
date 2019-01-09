class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :coach_id
      t.integer :course_niveau_id
      t.integer :course_place_id
      t.integer :course_day_id

      t.timestamps
    end
  end
end

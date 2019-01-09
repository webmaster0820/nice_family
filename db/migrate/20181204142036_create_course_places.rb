class CreateCoursePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :course_places do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end

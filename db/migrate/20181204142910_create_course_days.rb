class CreateCourseDays < ActiveRecord::Migration[5.2]
  def change
    create_table :course_days do |t|
      t.date :day

      t.timestamps
    end
  end
end

class AddCourseCategoryIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :course_category_id, :integer
    add_column :courses, :age_from, :integer
    add_column :courses, :age_to, :integer
    add_column :courses, :date, :date
    add_column :courses, :time_from, :time
    add_column :courses, :time_to, :time
  end
end

class RemoveAgeFromAndAgeToFromCourses < ActiveRecord::Migration[5.2]
  def change
  	remove_column :courses, :age_from, :string
  	remove_column :courses, :age_to, :string
  end
end

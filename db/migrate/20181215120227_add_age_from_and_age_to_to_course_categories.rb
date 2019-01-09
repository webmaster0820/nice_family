class AddAgeFromAndAgeToToCourseCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :course_categories, :age_from, :integer
    add_column :course_categories, :age_to, :integer
  end
end

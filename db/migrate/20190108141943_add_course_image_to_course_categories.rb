class AddCourseImageToCourseCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :course_categories, :course_image, :string
  end
end

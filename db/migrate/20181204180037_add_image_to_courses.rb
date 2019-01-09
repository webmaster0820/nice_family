class AddImageToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :course_image, :string
  end
end

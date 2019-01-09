class AddCourseIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :course_id, :integer
  end
end

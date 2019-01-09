class CreateJoinTableCoursesMembers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :members do |t|
      t.index [:course_id, :member_id]
      t.index [:member_id, :course_id]
    end
  end
end

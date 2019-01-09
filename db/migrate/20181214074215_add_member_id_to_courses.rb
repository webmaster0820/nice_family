class AddMemberIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :member_id, :integer
  end
end

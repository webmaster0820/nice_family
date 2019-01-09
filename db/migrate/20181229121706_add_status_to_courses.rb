class AddStatusToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :status, :integer, default: 0
  end
end

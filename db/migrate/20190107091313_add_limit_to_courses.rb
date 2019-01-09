class AddLimitToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :limit, :integer, default: 100
  end
end

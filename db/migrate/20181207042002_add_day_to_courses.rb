class AddDayToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :day, :date
  end
end

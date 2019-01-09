class AddCityIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :course_places, :city_id, :integer
  end
end

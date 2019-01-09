class AddCityToCoursePlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :course_places, :city, :string
  end
end

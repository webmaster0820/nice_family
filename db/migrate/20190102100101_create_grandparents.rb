class CreateGrandparents < ActiveRecord::Migration[5.2]
  def change
    create_table :grandparents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :member_id
      t.integer :child_id
      t.integer :course_id

      t.timestamps
    end
  end
end

class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :member_id
      t.integer :course_id

      t.timestamps
    end
  end
end

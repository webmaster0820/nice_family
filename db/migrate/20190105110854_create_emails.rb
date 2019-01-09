class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :content
      t.integer :course_id
      t.integer :member_id
      t.integer :status, default: 0
      t.integer :coach_id

      t.timestamps
    end
  end
end

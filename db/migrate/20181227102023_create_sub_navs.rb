class CreateSubNavs < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_navs do |t|
      t.string :title
      t.integer :nav_id
      t.integer :page_id

      t.timestamps
    end
  end
end

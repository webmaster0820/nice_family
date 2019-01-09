class AddNumberToNav < ActiveRecord::Migration[5.2]
  def change
    add_column :navs, :number, :integer
    add_column :navs, :page_id, :integer
  end
end

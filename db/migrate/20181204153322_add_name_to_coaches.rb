class AddNameToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :name, :string
  end
end

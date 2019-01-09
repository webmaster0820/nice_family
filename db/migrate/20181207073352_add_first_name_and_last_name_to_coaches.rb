class AddFirstNameAndLastNameToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :first_name, :string
    add_column :coaches, :last_name, :string
  end
end

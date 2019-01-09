class AddFirstNameAndLastNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
  end
end

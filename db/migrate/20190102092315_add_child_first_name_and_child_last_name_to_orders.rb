class AddChildFirstNameAndChildLastNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :child_first_name, :string
    add_column :orders, :child_last_name, :string
  end
end

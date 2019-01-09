class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :sub_total, precision: 15, scale: 2
      t.string :token

      t.timestamps
    end
  end
end

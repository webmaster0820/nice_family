class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 15, scale: 2

      t.timestamps
    end
  end
end

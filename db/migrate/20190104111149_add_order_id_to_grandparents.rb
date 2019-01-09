class AddOrderIdToGrandparents < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :order_id, :integer
  end
end

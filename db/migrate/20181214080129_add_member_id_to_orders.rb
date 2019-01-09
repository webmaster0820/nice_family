class AddMemberIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :member_id, :integer
  end
end

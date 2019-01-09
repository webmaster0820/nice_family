class AddStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string, default: 'kurv'

    Order.where(status: nil).update_all(status: 'kurv')
  end
end

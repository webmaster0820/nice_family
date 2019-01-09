class AddOrderIdToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :order_id, :integer
  end
end

class AddGrandparentIdToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :grandparent_id, :integer
  end
end

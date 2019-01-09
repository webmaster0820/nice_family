class AddChildIdToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :child_id, :integer
  end
end

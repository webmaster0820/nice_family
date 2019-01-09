class AddParticipationIdToGrandparents < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :participation_id, :integer
  end
end

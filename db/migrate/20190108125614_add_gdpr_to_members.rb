class AddGdprToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :gdpr, :integer
  end
end

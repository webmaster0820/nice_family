class AddPhoneToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :phone, :string
  end
end

class AddProfilePicToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :profile_pic, :string
  end
end

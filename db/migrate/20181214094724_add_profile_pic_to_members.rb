class AddProfilePicToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :profile_pic, :string
  end
end

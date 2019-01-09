class AddLinkToSubNavs < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_navs, :link, :string
  end
end

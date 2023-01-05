class UpdateGroupsImage < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :image_url
  end
end

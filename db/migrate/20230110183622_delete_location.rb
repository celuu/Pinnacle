class DeleteLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :location_id
  end
end

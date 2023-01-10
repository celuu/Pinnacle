class UpdateGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :location
    add_column :groups, :location_id, :bigInt
    add_index :groups, :location_id
    add_foreign_key :groups, :clubs, column: :location_id
  end
end

class UpdatingTables < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :club_id, :bigint
    add_index :groups, :club_id
    add_foreign_key :groups, :clubs, column: :club_id
  end
end

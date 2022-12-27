class UpdateGroupTable < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :time, :string
  end
end

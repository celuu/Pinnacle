class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :address, :string
    add_column :clubs, :phone_num, :string
  end
end

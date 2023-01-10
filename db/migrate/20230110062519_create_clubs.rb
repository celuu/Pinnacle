class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :location, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false


      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :day_of_week, null: false
      t.string :instructor_name, null: false
      t.string :location, null: false
      t.string :image_url

      t.timestamps
    end
  end
end

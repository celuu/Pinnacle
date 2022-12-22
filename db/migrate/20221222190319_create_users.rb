class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :user
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :username, null: false, unique: true
      t.string :email, null: false
      t.string :password_digest, unique: true
      t.string :session_token, null: false, index: {unique: true}

      t.timestamps
    end
  end
end

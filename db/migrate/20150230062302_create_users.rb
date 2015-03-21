class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :unique => true
      t.string :email, :null => false, :unique => true
      t.string :crypted_password
      t.string :salt
      t.string :full_name
      t.string :session_key
      t.string :activation_key
      t.string :bio
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :session_key
  end
end


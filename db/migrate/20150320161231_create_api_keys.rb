class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.references :user
      t.string :access_token, null: false
      t.integer :user_scope_cd, null: false, default: 0
      t.datetime :expired_at

      t.timestamps
    end
    add_index :api_keys, :user_id
    add_index :api_keys, :access_token, :unique => true
  end
end

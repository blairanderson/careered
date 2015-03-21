class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :board_id, :null => false
      t.string :title
      t.string :slug, null: false
      t.text :description
      t.boolean :open, :null => false, :default => true
      t.integer :position, null: false
      t.text :card_template

      t.timestamps
    end
    add_index :lists, :board_id
  #   list.order('positit DESC NULLS LAST')
  end
end

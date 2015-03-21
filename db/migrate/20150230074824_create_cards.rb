class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :list_id, null: false
      t.string :title, null: false
      t.text :description
      t.datetime :due_date
      t.boolean :open, null: false, default: true
      t.integer :comment_count, null: false, default: 0
      t.string :url
      t.integer :assignee_id
      t.integer :position
      t.integer :company_id
      t.integer :salary

      t.timestamps
    end
    add_index :cards, :list_id
  end
end

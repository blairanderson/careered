class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user
      t.datetime :expired_at
      t.string :job_title, null: false, default: "job title"
      t.string :job_locations, null: false, default: "where can the human work from?"
      t.integer :job_type_enum, null: false, default: 0
      t.text :description, null: false, default: "This is your job description. make it cool"
      t.string :company_name, null: false, default: "the company name"
      t.string :company_url, null: false, default: ""
      t.text :company_logo
      t.integer :how_to_apply_enum, null: false, default: 0
      t.string :contact_email, null: false, default: "your email here@gmail.com"

      t.timestamps null: false
    end
  end
end

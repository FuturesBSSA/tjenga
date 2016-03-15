class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.references :developer, index: true, foreign_key: true
      t.text :description
      t.string :photo
      t.string :client_name
      t.string :website_url

      t.timestamps null: false
    end
  end
end

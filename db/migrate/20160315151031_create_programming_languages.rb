class CreateProgrammingLanguages < ActiveRecord::Migration
  def change
    create_table :programming_languages do |t|
      t.string :name
      t.references :developer, index: true, foreign_key: true
      t.integer :level

      t.timestamps null: false
    end
  end
end

class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :content
      t.references :client, index: true, foreign_key: true
      t.references :developer, index: true, foreign_key: true
      t.string :author_type

      t.timestamps null: false
    end
  end
end

class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :content
      t.references :author, polymorphic: true, index: true
      t.references :developer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

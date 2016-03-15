class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description

      t.references :author, polymorphic: true, index: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

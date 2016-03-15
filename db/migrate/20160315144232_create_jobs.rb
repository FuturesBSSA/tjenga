class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :difficulty_level
      t.integer :budget
      t.string :duration
      t.date :start_date
      t.date :deadline
      t.string :request_type
      t.string :status
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

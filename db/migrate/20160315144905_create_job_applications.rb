class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.references :developer, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.text :motivation
      t.string :status
      t.integer :price

      t.timestamps null: false
    end
  end
end

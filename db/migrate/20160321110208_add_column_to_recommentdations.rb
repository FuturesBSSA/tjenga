class AddColumnToRecommentdations < ActiveRecord::Migration
  def change
    add_column :recommendations, :first_name, :string
    add_column :recommendations, :last_name, :string
    add_column :recommendations, :status, :string
    add_column :recommendations, :title, :string
  end
end

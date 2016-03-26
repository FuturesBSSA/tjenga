class AddAdminToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :admin, :boolean, null: false, default: false
  end
end

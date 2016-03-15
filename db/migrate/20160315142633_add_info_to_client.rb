class AddInfoToClient < ActiveRecord::Migration
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :company, :string
    add_column :clients, :phone_number, :string
    add_column :clients, :city, :string
    add_column :clients, :address, :string
    add_column :clients, :photo, :string
  end
end

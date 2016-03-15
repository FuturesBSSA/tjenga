class AddInfoToDeveloper < ActiveRecord::Migration
  def change
    add_column :developers, :first_name, :string
    add_column :developers, :last_name, :string
    add_column :developers, :phone_number, :string
    add_column :developers, :city, :string
    add_column :developers, :address, :string
    add_column :developers, :photo, :string
    add_column :developers, :price_per_hour, :integer
    add_column :developers, :expertise, :string
    add_column :developers, :availability, :string
  end
end

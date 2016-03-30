class AddLinkedinPictureToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :linkedin_picture, :string
  end
end

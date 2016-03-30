class AddOmniauthToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :provider, :string
    add_column :developers, :uid, :string
    add_column :developers, :token, :string
    add_column :developers, :token_expiry, :datetime
  end
end

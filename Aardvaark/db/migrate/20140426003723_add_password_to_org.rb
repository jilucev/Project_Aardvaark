class AddPasswordToOrg < ActiveRecord::Migration
  def change
    add_column :organizations, :password_digest, :string
    add_column :organizations, :password, :string
  end
end

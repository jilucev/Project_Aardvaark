class AddRepNametoOrg < ActiveRecord::Migration
  def change
    add_column :organizations, :representative_name, :string
  end
end

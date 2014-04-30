class AddFilterableInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :skills, :text
    add_column :users, :age, :integer
    add_column :users, :vehicle, :boolean
  end
end

class AddVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :user_id
      t.integer :capacity
      t.timestamps
    end
  end
end

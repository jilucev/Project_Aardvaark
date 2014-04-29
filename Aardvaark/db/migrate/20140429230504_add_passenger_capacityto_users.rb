class AddPassengerCapacitytoUsers < ActiveRecord::Migration
  def change
    add_column :users, :passenger_capacity, :integer
  end
end

class CreateEventsUsersTable < ActiveRecord::Migration
  def change
    create_table :events_users_tables do |t|
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
  end
end

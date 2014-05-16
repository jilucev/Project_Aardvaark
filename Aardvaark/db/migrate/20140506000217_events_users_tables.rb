class EventsUsersTables < ActiveRecord::Migration
  def change
    rename_table :events_users_tables, :events_users
  end
end

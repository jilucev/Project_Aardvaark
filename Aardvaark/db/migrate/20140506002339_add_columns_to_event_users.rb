class AddColumnsToEventUsers < ActiveRecord::Migration
  def change
    add_column :event_users, :event_id, :integer
    add_column :event_users, :user_id, :integer
  end
end

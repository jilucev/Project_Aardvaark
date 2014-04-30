class AddTimeAndLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_time, :time
    add_column :events, :location, :string
  end
end

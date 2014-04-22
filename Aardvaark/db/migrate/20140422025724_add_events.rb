class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :description
      t.string :type
      t.timestamps
    end
  end
end

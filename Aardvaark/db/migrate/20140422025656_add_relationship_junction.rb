class AddRelationshipJunction < ActiveRecord::Migration
  def change
    create_table :relationship_junctions do |t|
      t.integer :organization_id
      t.integer :user_id
      t.integer :role_code
      t.timestamps
    end
  end
end

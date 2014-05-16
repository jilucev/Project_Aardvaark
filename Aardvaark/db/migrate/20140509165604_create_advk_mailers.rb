class CreateAdvkMailers < ActiveRecord::Migration
  def change
    create_table :advk_mailers do |t|

      t.timestamps
    end
  end
end

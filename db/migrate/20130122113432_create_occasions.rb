class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.integer :work_id
      t.integer :event_id

      t.timestamps
    end
  end
end

class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :artist_id
      t.integer :event_id

      t.timestamps
    end
  end
end

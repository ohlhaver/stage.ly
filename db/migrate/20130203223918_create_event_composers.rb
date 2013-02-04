class CreateEventComposers < ActiveRecord::Migration
  def change
    create_table :event_composers do |t|
      t.integer :artist_id
      t.integer :event_id

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :venue_id
      t.time :time
      t.string :price
      t.string :url

      t.timestamps
    end
  end
end

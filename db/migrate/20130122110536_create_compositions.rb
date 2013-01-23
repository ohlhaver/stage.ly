class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.integer :work_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
